class Subscription {
  String id;
  DateTime TimeOfCreating;
  String SubscriberId;
  String SubscribedOnId;

  Subscription(this.id, this.TimeOfCreating, this.SubscriberId, this.SubscribedOnId);

  @override
  Map<String, dynamic> toMap() => {
    'id': id,
    'class': 'Subscription',
    'subscriberId': SubscriberId,
    'subscribedOnId': SubscribedOnId,
    'time': TimeOfCreating,
  };

  factory Subscription.fromJson(Map<String, dynamic> json) {
    final time = json['time_of_creating'] ?? json['time'];
    return Subscription(
      json['id'] as String,
      time is DateTime ? time : DateTime.parse(time.toString()),
      (json['subscriber_id'] ?? json['subscriberId']) as String,
      (json['subscribed_on_id'] ?? json['subscribedOnId']) as String,
    );
  }
}