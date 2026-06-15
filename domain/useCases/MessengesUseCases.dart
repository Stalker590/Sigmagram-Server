import '../Entities/entities.dart';
import 'RandomRule.dart';
import '../repositories/i_messenger_repository.dart';

class MessengesUseCases {
  final IMessengerRepository repository; 

  MessengesUseCases(this.repository);

  Future<void> SendMessenge(String content, String senderId, String chatId) async {
    final msg = Messenge(id: MakeRandomNumber(), senderId: senderId, timeOfCreating: DateTime.now(), text: content, chatId: chatId);
    await repository.sendMessenge(msg); 
  }
}