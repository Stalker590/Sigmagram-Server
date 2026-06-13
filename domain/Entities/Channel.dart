import 'Chat.dart';

class Channel extends Chat{
  int CountOfUsers;
  int subscribers;
  
  Channel(super.id, super.Name, super.TimeOfCreating, this.CountOfUsers, this.subscribers);

  @override
  Map<String, dynamic> toMap() => {
    'id': id,
    'class': 'Channel',
    'name': name,
    'count': CountOfUsers,
    'subscribers': subscribers,
    'time': TimeOfCreating,
  };
}