import 'package:postgres/postgres.dart';
import 'repositories/repositories.dart';

Future<void> DataBaseInit(Connection db) async {
  await UserRepository(db).CreateUserTable();
  await GroupRepository(db).CreateGroupTable();
  await ChannelRepository(db).CreateChannelTable();
  await SubscriptionRepository(db).CreateSubscriptionTable();
  await MessengeRepository(db).CreateMessengeTable();
}