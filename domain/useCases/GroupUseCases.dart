import '../Entities/entities.dart';
import 'RandomRule.dart';
import '../repositories/i_group_repository.dart';

class CreateGroupUseCase {
  final IGroupRepository repository;

  CreateGroupUseCase(this.repository);

  Future<void> createGroup(String name) async {
    final group = Group(MakeRandomNumber(), name, DateTime.now(), 0);
    await repository.CreateGroup(group);
  }
}