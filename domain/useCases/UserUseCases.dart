import '../Entities/entities.dart';
import 'RandomRule.dart';
import '../repositories/i_user_repository.dart';

class UserUseCases {
  final IUserRepository repository; 

  UserUseCases(this.repository);

  Future<void> registerUser(String name, String password) async {
    final user = User(MakeRandomNumber(), password, DateTime.now(), name);
    await repository.RegisterUser(user); 
  }

  Future<IsAuth> loginUser(String name, String password) async {
    return await repository.LoginUser(name, password);
  } 
}