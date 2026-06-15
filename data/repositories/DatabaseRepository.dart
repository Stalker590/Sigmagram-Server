import 'package:postgres/postgres.dart';
import 'repositories.dart';

class DataBaseRepository {
  DataBaseRepository();

  Future<Connection> DatabaseConnecting(String Host, int Port, String Database, String Username, String Password) async {
    final initialConnection = await Connection.open(
      Endpoint(host: Host, port: Port, database: 'postgres', username: Username, password: Password),
      settings: ConnectionSettings(sslMode: SslMode.disable),
    );

    final result = await initialConnection.execute(
      Sql.named("SELECT 1 FROM pg_database WHERE datname = @dbName"),
      parameters: {'dbName': Database},
    );

    if (result.isEmpty) {
      print("Базу даних '$Database' не знайдено. Створюю...");
      await initialConnection.execute("CREATE DATABASE $Database;");
    }
    
    await initialConnection.close();

    final connection = await Connection.open(
      Endpoint(host: Host, port: Port, database: Database, username: Username, password: Password),
      settings: ConnectionSettings(sslMode: SslMode.disable),
    );
    
    print("Успішне підключення до бази $Database!");
    return connection;
  }

  
  Future<void> DataBaseInit(Connection db) async {
    print("Ініціалізація таблиць...");
    await UserRepository(db).CreateUserTable();
    await GroupRepository(db).CreateGroupTable();
    await ChannelRepository(db).CreateChannelTable();
    await SubscriberRepository(db).CreateSubscriptionTable();
    await MessengeRepository(db).CreateMessengeTable();
  }
}