import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:dotenv/dotenv.dart';
import 'package:postgres/postgres.dart';
import 'data/repositories/repositories.dart';

late final Connection connection;

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  final env = DotEnv(includePlatformEnvironment: true)..load(['.env']);
  final host = env['HOST'];
  final portDb = env['PORT'];
  final database = env['DATABASE'];
  final username = env['USERNAME'];
  final password = env['PASSWORD'];

  final databaseRepository = DataBaseRepository();
  connection = await databaseRepository.DatabaseConnecting(
    host!,
    int.parse(portDb!),
    database!,
    username!,
    password!,
  );
  await databaseRepository.DataBaseInit(connection);

  return serve(handler, InternetAddress.anyIPv4, port);
}