import '../Entities/entities.dart';

abstract class IMessengerRepository {
  Future<void> sendMessenge(Messenge message);
  Future<List<Messenge>> getMessages(String chatId);
  Future<void> CreateMessengeTable();
}