import 'package:dart_frog/dart_frog.dart';
import '../domain/useCases/usecases.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;
  final method = request.method;

  if (method != HttpMethod.get) {
    return Response.json(
      statusCode: 405,
      body: {'error': 'Method not allowed'},
    );
  }

  final body = await request.json() as Map<String, dynamic>;
  final nameId = body['chatId'] as String?;

  if (nameId == null) {
    return Response.json(
      statusCode: 400,
      body: {'error': 'Missing required field: name'},
    );
  }

  final messengesUseCase = context.read<MessengesUseCases>();
  final messages = await messengesUseCase.getMessages(nameId);

  return Response.json(
    body: {'success': true, 'messages': messages},
  );
}