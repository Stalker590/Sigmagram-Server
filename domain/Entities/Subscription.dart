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
}