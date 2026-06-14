import 'package:postgres/postgres.dart';


Future<Connection> DatabaseConnecting(
  String Host,
  int Port,
  String Database,
  String Username,
  String Password,
) async {
  final connection = await Connection.open(
    Endpoint(
      host: Host,
      port: Port,
      database: Database,
      username: Username,
      password: Password,
    ),
    settings: ConnectionSettings(
      sslMode: SslMode.disable,
    ),
  );
  
  print("Успішне підключення до бази!");
  return connection;
}

