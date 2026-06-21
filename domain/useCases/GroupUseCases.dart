import '../Entities/entities.dart';
import 'RandomRule.dart';
import '../repositories/i_group_repository.dart';

class GroupUseCases {
  final IGroupRepository repository;

  GroupUseCases(this.repository);

  Future<Group> createGroup(String name) async {
    final group = Group(MakeRandomNumber(), name, DateTime.now(), 0);
    await repository.CreateGroup(group);
    return group;
  }

  Future<Group?> findGroupById(String id) {
    return repository.FindGroupById(id);
  }
}
