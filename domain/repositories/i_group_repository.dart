import '../Entities/entities.dart';

abstract class IGroupRepository {
  Future<void> CreateGroup(Group group);
  Future<Group?> FindGroupById(String id);
  Future<void> CreateGroupTable();
}
