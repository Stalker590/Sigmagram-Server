import 'Chat.dart';

class Group extends Chat {
  int CountOfUsers;
  Group(super.id, super.Name, super.TimeOfCreating, this.CountOfUsers);

  @override
  Map<String, dynamic> toMap() => {
    'id': id,
    'class': 'Group',
    'name': name,
    'count': CountOfUsers,
    'time': TimeOfCreating,
  };
} 
