import '../Entities/entities.dart';
import 'RandomRule.dart';
import '../repositories/i_subscriptions_repository.dart';

class SubscriptionsUseCases {
  final ISubscriberRepository repository;

  Future<void> RegisterSubscription(String SubscriptionId, String SubscriptionOnId) async {
    final sub = Subscription(MakeRandomNumber(), DateTime.now(), SubscriptionId, SubscriptionOnId);
    await repository.RegisterSubscription(sub);
  }

  Future<List<Subscription>> GetSubscriptions(String SubscriptionOnId) async {
    return await repository.GetSubscriptions(SubscriptionOnId);
  }

  SubscriptionsUseCases(this.repository);
}
