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

  if (name == null) {
    return Response.json(
      statusCode: 400,
      body: {'error': 'Missing required field: name'},
    );
  }

  final groupUseCase = context.read<GroupUseCases>();
  try{
    await groupUseCase.createGroup(name);
  }catch(e){
    return Response.json(
      statusCode: 500,
      body: {'error': e.toString()},
    );
  }

  return Response.json(
    body: {'success': true, 'message': 'Group created successfully'},
  );
}