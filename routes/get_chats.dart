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

  final subscriptionsUseCase = context.read<SubscriptionsUseCases>();
  final subscriptions =
      await subscriptionsUseCase.GetSubscriptions(user!.id);

  final chats = <Map<String, dynamic>>[
    {
      'id': 'global',
      'name': 'Sigmagram Global',
      'type': 'global',
    },
    ...subscriptions.map(
      (s) => {
        'id': s.SubscribedOnId,
        'name': s.SubscribedOnId,
        'type': 'subscription',
      },
    ),
  ];

  return Response.json(
    body: {'success': true, 'chats': chats},
  );
}
