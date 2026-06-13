import 'package:postgres/postgres.dart';
import '../../domain/Entities/Group.dart';

class GroupRepository {
  final Connection _db;

  GroupRepository(this._db);

  Future<void> CreateGroup(Group group) async {
    try {
      await _db.execute(
        Sql.named("INSERT INTO groups (id, name, time_of_creating, count_of_users) VALUES (@id, @name, @time, @count)"),
        parameters: {'id': group.id, 'name': group.name, 'time': group.TimeOfCreating, 'count': group.CountOfUsers},
      );
      print("Групний чат ${group.name} доданий до бази.");
    } catch (e) {
      print("Помилка при додаванні групного чату: $e");
    }
  }


  Future<void> CreateGroupTable() async {
    await _db.execute(
      "CREATE TABLE IF NOT EXISTS groups (id VARCHAR PRIMARY KEY, name VARCHAR, time_of_creating TIMESTAMP, count_of_users INTEGER)",
    );
  }
}
