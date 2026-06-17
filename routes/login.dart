import 'package:dart_frog/dart_frog.dart';
import '../domain/useCases/usecases.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;
  final method = request.method;

  if (method != HttpMethod.post) {
    return Response.json(
      statusCode: 405,
      body: {'error': 'Method not allowed'},
    );
  }

  final body = await request.json() as Map<String, dynamic>;
  final name = body['name'] as String?;
  final password = body['password'] as String?;

  if (name == null || password == null) {
    return Response.json(
      statusCode: 400,
      body: {'error': 'Missing required fields: name and password'},
    );
  }

  final userUseCase = context.read<UserUseCases>();
  final isAuth = await userUseCase.loginUser(name, password);

  if (isAuth.isAuthed == false) {
    await userUseCase.registerUser(name, password);
  }

  return Response.json(
    body: {
      'isAuthed': isAuth.isAuthed,
      'user': isAuth.user != null
          ? {
              'id': isAuth.user!.id,
              'name': isAuth.user!.name,
            }
          : null,
    },
  );
}
