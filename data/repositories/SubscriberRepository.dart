import 'package:postgres/postgres.dart';
import '../../domain/Entities/Subscription.dart';

class SubscriptionRepository {
  final Connection _db;

  SubscriptionRepository(this._db);

  Future<void> Subscribe(Subscription subscription) async {
    try {
      await _db.execute(
        Sql.named("INSERT INTO subscriptions (id, subscriber_id, time_of_creating, subscribed_on_id) VALUES (@id, @subscriber_id, @time, @subscribed_on_id)"),
        parameters: {'id': subscription.id, 'subscriber_id': subscription.SubscriberId, 'time': subscription.TimeOfCreating, 'subscribed_on_id': subscription.SubscribedOnId},
      );
      print("Підписка ${subscription} додана до бази.");
    } catch (e) {
      print("Помилка при додаванні підписки: $e");
    }
  }

  Future<void> CreateSubscriptionTable() async {
    await _db.execute(
      "CREATE TABLE IF NOT EXISTS subscriptions (id VARCHAR PRIMARY KEY, subscriber_id VARCHAR, time_of_creating TIMESTAMP, subscribed_on_id VARCHAR)",
    );
  }
}
