import 'dart:math';

abstract class Chat {
  String id;
  String name;
  DateTime TimeOfCreating;

  Chat(this.id, this.name, this.TimeOfCreating);
}