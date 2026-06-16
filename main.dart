import 'package:dotenv/dotenv.dart';
import 'data/repositories/repositories.dart';
import 'domain/useCases/usecases.dart';
import 'domain/Entities/entities.dart';


Future<IsAuth> isAuthenticated(String name, String password, UserUseCases userUseCase) async {
  final isAuth = await userUseCase.loginUser(name, password);
  return isAuth;
}


void main() async {
  var env = DotEnv(includePlatformEnvironment: true)..load(['.env']);

  final Host = env['HOST'];
  final Port = env['PORT'];
  final Database = env['DATABASE'];
  final Username = env['USERNAME'];
  final Password = env['PASSWORD'];

  final databaseRepository = DataBaseRepository();
  final connection = await databaseRepository.DatabaseConnecting(
    Host!,
    int.parse(Port!), 
    Database!,
    Username!,
    Password!,
  );
  await databaseRepository.DataBaseInit(connection);

  final messengeRepository = MessengeRepository(connection);
  final channelRepository = ChannelRepository(connection);
  final subscriberRepository = SubscriberRepository(connection);
  final groupRepository = GroupRepository(connection);
  final userRepository = UserRepository(connection);

  final messengesUseCase = MessengesUseCases(messengeRepository);
  final subscriptionsUseCase = SubscriptionsUseCases(subscriberRepository);
  final groupUseCase = GroupUseCases(groupRepository);
  final channelUseCase = ChannelUseCases(channelRepository);
  final userUseCase = UserUseCases(userRepository);
  
  await messengesUseCase.SendMessenge("Hello World!", "123", "123");
  final userName = "sigmaBahmut";
  final password = "1234";
  final isAuth = await isAuthenticated(userName, password, userUseCase);
  final action = "login";

  print("Login result: ${isAuth.isAuthed}");
 }

