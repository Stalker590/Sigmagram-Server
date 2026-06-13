import '../Entities/entities.dart';
import 'RandomRule.dart';

Channel ToDoChannel(String name){
  return Channel(MakeRandomNumber(), name, DateTime.now(), 0, 0);
}   

