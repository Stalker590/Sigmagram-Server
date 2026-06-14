import '../Entities/entities.dart';

abstract class ISubscriberRepository {
  Future<void> RegisterSubscription(Subscription subscription);
  Future<void> CreateSubscriptionTable();
}
