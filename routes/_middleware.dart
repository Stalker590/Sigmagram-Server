import 'package:dart_frog/dart_frog.dart';
import 'package:postgres/postgres.dart';
import '../main.dart';
import '../data/repositories/repositories.dart';
import '../domain/useCases/usecases.dart';

Handler middleware(Handler handler) {
  return handler
      .use(_provideDatabaseConnection())
      .use(_provideMessengeRepository())
      .use(_provideChannelRepository())
      .use(_provideSubscriberRepository())
      .use(_provideGroupRepository())
      .use(_provideUserRepository())
      .use(_provideMessengesUseCases())
      .use(_provideSubscriptionsUseCases())
      .use(_provideGroupUseCases())
      .use(_provideChannelUseCases())
      .use(_provideUserUseCases());
}

Middleware _provideDatabaseConnection() {
  return provider<Connection>((context) => connection);
}

Middleware _provideMessengeRepository() {
  return provider<MessengeRepository>((context) {
    final conn = context.read<Connection>();
    return MessengeRepository(conn);
  });
}

Middleware _provideChannelRepository() {
  return provider<ChannelRepository>((context) {
    final conn = context.read<Connection>();
    return ChannelRepository(conn);
  });
}

Middleware _provideSubscriberRepository() {
  return provider<SubscriberRepository>((context) {
    final conn = context.read<Connection>();
    return SubscriberRepository(conn);
  });
}

Middleware _provideGroupRepository() {
  return provider<GroupRepository>((context) {
    final conn = context.read<Connection>();
    return GroupRepository(conn);
  });
}

Middleware _provideUserRepository() {
  return provider<UserRepository>((context) {
    final conn = context.read<Connection>();
    return UserRepository(conn);
  });
}

Middleware _provideMessengesUseCases() {
  return provider<MessengesUseCases>((context) {
    final repository = context.read<MessengeRepository>();
    return MessengesUseCases(repository);
  });
}

Middleware _provideSubscriptionsUseCases() {
  return provider<SubscriptionsUseCases>((context) {
    final repository = context.read<SubscriberRepository>();
    return SubscriptionsUseCases(repository);
  });
}

Middleware _provideGroupUseCases() {
  return provider<GroupUseCases>((context) {
    final repository = context.read<GroupRepository>();
    return GroupUseCases(repository);
  });
}

Middleware _provideChannelUseCases() {
  return provider<ChannelUseCases>((context) {
    final repository = context.read<ChannelRepository>();
    return ChannelUseCases(repository);
  });
}

Middleware _provideUserUseCases() {
  return provider<UserUseCases>((context) {
    final repository = context.read<UserRepository>();
    return UserUseCases(repository);
  });
}
