import '../Entities/entities.dart';
import 'RandomRule.dart';
import '../repositories/i_channel_repository.dart';

class CreateChannelUseCase {
  final IChannelRepository repository;

  CreateChannelUseCase(this.repository);

  Future<void> createChannel(String name) async {
    final channel = Channel(MakeRandomNumber(), name, DateTime.now(), 0, 0);
    await repository.CreateChannel(channel);
  }
}