import 'package:postgres/postgres.dart';
import '../../domain/Entities/Group.dart';
import '../../domain/repositories/i_group_repository.dart';

class GroupRepository implements IGroupRepository {
  final Connection _db;

  GroupRepository(this._db);

  @override
  Future<void> CreateGroup(Group group) async {
    try {
      await _db.execute(
        Sql.named(
          "INSERT INTO groups (id, name, time_of_creating, count_of_users) VALUES (@id, @name, @time, @count)",
        ),
        parameters: {
          'id': group.id,
          'name': group.name,
          'time': group.TimeOfCreating,
          'count': group.CountOfUsers,
        },
      );
      print("Групний чат ${group.name} доданий до бази.");
    } catch (e) {
      print("Помилка при додаванні групного чату: $e");
    }
  }

  @override
  Future<Group?> FindGroupById(String id) async {
    final result = await _db.execute(
      Sql.named("SELECT * FROM groups WHERE id = @id LIMIT 1"),
      parameters: {'id': id},
    );

    if (result.isEmpty) return null;

    final row = result.first.toColumnMap();
    final time = row['time_of_creating'];
    return Group(
      row['id'] as String,
      row['name'] as String,
      time is DateTime ? time : DateTime.parse(time.toString()),
      row['count_of_users'] as int,
    );
  }

  @override
  Future<void> CreateGroupTable() async {
    await _db.execute(
      "CREATE TABLE IF NOT EXISTS groups (id VARCHAR PRIMARY KEY, name VARCHAR, time_of_creating TIMESTAMP, count_of_users INTEGER)",
    );
  }
}
