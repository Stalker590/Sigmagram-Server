import 'package:postgres/postgres.dart';
import '../../domain/Entities/Channel.dart';
import '../../domain/repositories/i_channel_repository.dart';

class ChannelRepository implements IChannelRepository {
  final Connection _db;

  ChannelRepository(this._db);

  @override
  Future<void> CreateChannel(Channel channel) async {
    try {
      await _db.execute(
        Sql.named("INSERT INTO channels (id, name, time_of_creating, count_of_users, count_of_subscribers) VALUES (@id, @name, @time, @count, @subscribers)"),
        parameters: {'id': channel.id, 'name': channel.name, 'time': channel.TimeOfCreating, 'count': channel.CountOfUsers, 'subscribers': channel.subscribers},
      );
      print("Канал ${channel.name} доданий до бази.");
    } catch (e) {
      print("Помилка при додаванні канала: $e");
    }
  }

  @override
  Future<void> CreateChannelTable() async {
    await _db.execute(
      "CREATE TABLE IF NOT EXISTS channels (id VARCHAR PRIMARY KEY, name VARCHAR, time_of_creating TIMESTAMP, count_of_users INTEGER, count_of_subscribers INTEGER)",
    );
  }
}
