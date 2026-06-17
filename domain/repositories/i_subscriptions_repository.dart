import '../Entities/entities.dart';

abstract class ISubscriberRepository {
  Future<void> RegisterSubscription(Subscription subscription);
  Future<void> CreateSubscriptionTable();
  Future<List<Subscription>> GetSubscriptions(String SubscriptionOnId);
}
