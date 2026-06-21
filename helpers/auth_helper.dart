import 'package:dart_frog/dart_frog.dart';
import '../domain/Entities/User.dart';
import '../domain/useCases/usecases.dart';

Future<(User?, Response?)> authenticate(
  RequestContext context,
  Map<String, dynamic> body,
) async {
  final name = body['name'] as String?;
  final password = body['password'] as String?;

  if (name == null || password == null) {
    return (
      null,
      Response.json(
        statusCode: 401,
        body: {'error': 'Missing required fields: name and password'},
      ),
    );
  }

  final userUseCase = context.read<UserUseCases>();
  final auth = await userUseCase.loginUser(name, password);

  if (!auth.isAuthed || auth.user == null) {
    return (
      null,
      Response.json(
        statusCode: 401,
        body: {'error': 'Invalid credentials'},
      ),
    );
  }

  return (auth.user, null);
}
