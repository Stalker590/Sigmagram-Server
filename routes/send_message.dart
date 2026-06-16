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
  final content = body['content'] as String?;
  final senderId = body['senderId'] as String?;
  final chatId = body['chatId'] as String?;

  if (content == null || senderId == null || chatId == null) {
    return Response.json(
      statusCode: 400,
      body: {'error': 'Missing required fields: content, senderId, chatId'},
    );
  }

  final messengesUseCase = context.read<MessengesUseCases>();
  await messengesUseCase.SendMessenge(content, senderId, chatId);

  return Response.json(
    body: {'success': true, 'message': 'Message sent successfully'},
  );
}
