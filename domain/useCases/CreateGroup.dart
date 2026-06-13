import '../Entities/entities.dart';
import 'RandomRule.dart';

Group ToDoGroup(String name){
  return Group(MakeRandomNumber(), name, DateTime.now(), 0);
}   

