import '../Entities/entities.dart';
import 'RandomRule.dart';
import '../repositories/i_subscriptions_repository.dart';

class SubscriptionsUseCases {
  final ISubscriberRepository repository;

  Future<void> RegisterSubscription(String SubscriptionId, String SubscriptionOnId) async {
    await repository.RegisterSubscription(Subscription(MakeRandomNumber(), DateTime.now(), SubscriptionId, SubscriptionOnId));
  }

  SubscriptionsUseCases(this.repository);
}
