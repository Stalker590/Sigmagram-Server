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

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        json['id'] as String,
        DateTime.parse(json['time'] as String),
        json['subscriberId'] as String,
        json['subscribedOnId'] as String,
      );
}