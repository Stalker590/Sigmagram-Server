import '../Entities/entities.dart';
import 'RandomRule.dart';

User RegisterUser(String name, String password){
  return User(MakeRandomNumber(), password, DateTime.now(), name);
} 

