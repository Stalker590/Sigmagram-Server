import '../Entities/entities.dart';

abstract class IMessengerRepository {
  Future<void> sendMessage(Messenge message);
  Future<List<Messenge>> getMessages(String chatId);
  Future<void> CreateMessengeTable();
}