import 'package:postgres/postgres.dart';
import '../../domain/Entities/User.dart';
import '../../domain/repositories/i_user_repository.dart';

class UserRepository implements IUserRepository {
  final Connection _db;

  UserRepository(this._db);

  @override
  Future<void> RegisterUser(User user) async {
    try {
      await _db.execute(
        Sql.named("INSERT INTO users (id, username, time_of_creating, password) VALUES (@id, @username, @time, @password)"),
        parameters: {'id': user.id, 'username': user.name, 'time': user.TimeOfCreating, 'password': user.Password},
      );
      print("Юзер ${user.name} доданий до бази.");
    } catch (e) {
      print("Помилка при додаванні юзера: $e");
    }
  }

  @override
  Future<User?> LoginUser(String username, String password) async {
    final result = await _db.execute(
      Sql.named("SELECT * FROM users WHERE username = @username AND password = @password"),
      parameters: {'username': username, 'password': password},
    );
    if (result.isEmpty) {
      print("Login failed: User not found.");;
    }
    return User.fromMap(result.first.toColumnMap());
  }

  @override
  Future<void> CreateUserTable() async {
    await _db.execute(
      "CREATE TABLE IF NOT EXISTS users (id VARCHAR PRIMARY KEY, username VARCHAR, time_of_creating TIMESTAMP, password VARCHAR)",
    );
  }
}
