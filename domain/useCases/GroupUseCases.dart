import '../Entities/entities.dart';
import 'RandomRule.dart';
import '../repositories/i_group_repository.dart';

class GroupUseCases {
  final IGroupRepository repository;

  GroupUseCases(this.repository);

  Future<void> createGroup(String name) async {
    final group = Group(MakeRandomNumber(), name, DateTime.now(), 0);
    await repository.CreateGroup(group);
  }
}