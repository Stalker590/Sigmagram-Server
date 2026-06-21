import 'package:dart_frog/dart_frog.dart';
import '../domain/useCases/usecases.dart';
import '../helpers/auth_helper.dart';

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
  final (user, authError) = await authenticate(context, body);
  if (authError != null) return authError;

  final content = body['content'] as String?;
  final chatId = body['chatId'] as String?;

  if (content == null || chatId == null) {
    return Response.json(
      statusCode: 400,
      body: {'error': 'Missing required fields: content, chatId'},
    );
  }

  if (content.trim().isEmpty) {
    return Response.json(
      statusCode: 400,
      body: {'error': 'Message content cannot be empty'},
    );
  }

  final messengesUseCase = context.read<MessengesUseCases>();
  await messengesUseCase.SendMessenge(content.trim(), user!.id, chatId);

  return Response.json(
    body: {'success': true, 'message': 'Message sent successfully'},
  );
}
