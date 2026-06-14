import '../Entities/entities.dart';

abstract class IUserRepository {
  Future<void> RegisterUser(User user);
  Future<User?> LoginUser(String username, String password);
  Future<void> CreateUserTable();
}