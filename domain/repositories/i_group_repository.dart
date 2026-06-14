import '../Entities/entities.dart';

abstract class IGroupRepository {
  Future<void> CreateGroup(Group group);
  Future<void> CreateGroupTable();
}