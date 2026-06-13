import 'data/databaseConnecting.dart';
import 'data/databaseInit.dart';
import 'package:dotenv/dotenv.dart';


void main() async {
  var env = DotEnv(includePlatformEnvironment: true)..load(['.env']);

  final Host = env['HOST'];
  final Port = env['PORT'];
  final Database = env['DATABASE'];
  final Username = env['USERNAME'];
  final Password = env['PASSWORD'];

  final db = await DatabaseConnecting(
    Host!,
    int.parse(Port!), 
    Database!,
    Username!,
    Password!,
  );
  await DataBaseInit(db);
}

