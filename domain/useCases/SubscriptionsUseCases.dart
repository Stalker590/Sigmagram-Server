import '../Entities/entities.dart';
import 'RandomRule.dart';
import '../repositories/i_subscriptions_repository.dart';

class SubscriptionsUseCases {
  final ISubscriberRepository repository;

  Future<void> RegisterSubscription(String SubscriptionId, String SubscriptionOnId) async {
    final sub = Subscription(MakeRandomNumber(), DateTime.now(), SubscriptionId, SubscriptionOnId);
    await repository.RegisterSubscription(sub);
  }

  SubscriptionsUseCases(this.repository);
}
