import 'package:postgres/postgres.dart';
import '../../domain/Entities/Messenge.dart';
import '../../domain/repositories/i_messenger_repository.dart';

class MessengeRepository implements IMessengerRepository{
  final Connection _db;

  MessengeRepository(this._db);

  @override
  Future<void> sendMessenge(Messenge messenge) async {
    try {
      await _db.execute(
        Sql.named("INSERT INTO messenges (id, sender_id, time_of_creating, text, chat_id) VALUES (@id, @sender_id, @time, @text, @chat_id)"),
        parameters: {'id': messenge.id, 'sender_id': messenge.senderId, 'time': messenge.timeOfCreating, 'text': messenge.text, 'chat_id': messenge.chatId},
      );
      print("Повідомлення ${messenge.text} доданий до бази.");
    } catch (e) {
      print("Помилка при додаванні повідомлення: $e");
    }
  }

  @override
  Future<List<Messenge>> getMessages(String chatId) async {
    final result = await _db.execute(
      Sql.named("SELECT * FROM messenges WHERE chat_id = @chat_id ORDER BY time_of_creating ASC"),
      parameters: {'chat_id': chatId},
    );

    return result.map((row) => Messenge.fromMap(row.toColumnMap())).toList();
  }

  Future<void> CreateMessengeTable() async {
    await _db.execute(
      "CREATE TABLE IF NOT EXISTS messenges (id VARCHAR PRIMARY KEY, sender_id VARCHAR, time_of_creating TIMESTAMP, text VARCHAR, chat_id VARCHAR)",
    );
  }
}
