import '../Entities/entities.dart';
import 'RandomRule.dart';

Messenge ToSendMessenge(String content, String senderId, String ChatId){
  return Messenge(id: MakeRandomNumber(), senderId: senderId, timeOfCreating: DateTime.now(), text: content, chatId: ChatId);
}
