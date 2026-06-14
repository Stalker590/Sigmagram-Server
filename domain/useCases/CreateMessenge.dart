import '../Entities/entities.dart';
import 'RandomRule.dart';
import '../repositories/i_messenger_repository.dart';

class SendMessageUseCase {
  final IMessengerRepository repository; // Тут з'являється репозиторій!

  SendMessageUseCase(this.repository);

  Future<void> execute(String content, String senderId, String chatId) async {
    // 1. Створюємо об'єкт (те, що ти вже робиш)
    final msg = Messenge(id: MakeRandomNumber(), senderId: senderId, timeOfCreating: DateTime.now(), text: content, chatId: chatId);
    
    // 2. А тепер Виконуємо дію (те, чого зараз немає)
    await repository.sendMessage(msg); // Ось тут репозиторій оживає!
  }
}