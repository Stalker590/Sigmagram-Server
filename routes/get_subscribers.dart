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
  final SubscriberId = body['SubscriberId'] as String?;
  final SubscriptionOnId = body['SubscriptionOnId'] as String?;

  if (SubscriptionOnId == null) {
    return Response.json(
      statusCode: 400,
      body: {'error': 'Missing required field: SubscriptionOnId'},
    );
  }

  final subscriptionsUseCase = context.read<SubscriptionsUseCases>();
  final subscriptions = await subscriptionsUseCase.GetSubscriptions(SubscriberId!, SubscriptionOnId!);

  return Response.json(
    body: {'success': true, 'subscriptions': subscriptions},
  );
}