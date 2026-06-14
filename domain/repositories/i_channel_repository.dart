import '../Entities/entities.dart';

abstract class IChannelRepository {
  Future<void> CreateChannel(Channel channel);
  Future<void> CreateChannelTable();
}
