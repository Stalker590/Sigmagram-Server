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
  final SubscriptionId = body['SubscriptionId'] as String?;
  final SubscriptionOnId = body['SubscriptionOnId'] as String?;

  if (SubscriptionId == null) {
    return Response.json(
      statusCode: 400,
      body: {'error': 'Missing required field: SubscriptionId'},
    );
  }

  final subscriptionUseCase = context.read<SubscriptionsUseCases>();
  try{
    await subscriptionUseCase.RegisterSubscription(SubscriptionId!, SubscriptionOnId!);
  }catch(e){
    return Response.json(
      statusCode: 500,
      body: {'error': e.toString()},
    );
  }

  return Response.json(
    body: {'success': true, 'message': 'Subscription created successfully'},
  );
}