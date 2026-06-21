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
  final (_, authError) = await authenticate(context, body);
  if (authError != null) return authError;

  final chatId = body['chatId'] as String?;
  if (chatId == null || chatId.trim().isEmpty) {
    return Response.json(
      statusCode: 400,
      body: {'error': 'Missing required field: chatId'},
    );
  }

  final groupUseCase = context.read<GroupUseCases>();
  final group = await groupUseCase.findGroupById(chatId.trim());

  if (group == null) {
    return Response.json(
      statusCode: 404,
      body: {'error': 'Чат з таким ID не знайдено'},
    );
  }

  return Response.json(
    body: {
      'success': true,
      'chat': {
        'id': group.id,
        'name': group.name,
        'type': 'group',
      },
    },
  );
}
