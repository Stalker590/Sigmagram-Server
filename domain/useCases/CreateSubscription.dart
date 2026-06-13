import '../Entities/entities.dart';
import 'RandomRule.dart';

Subscription ToDoSubscription(String subscriberId, String subscribedOnId){
  return Subscription(MakeRandomNumber(), DateTime.now(), subscriberId, subscribedOnId);
}


