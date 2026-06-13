class User {
  String id;
  DateTime TimeOfCreating;
  String name;
  String Password;

  User(this.id, this.Password, this.TimeOfCreating, this.name);

  @override
  Map<String, dynamic> toMap() => {
    'id': id,
    'class': 'User',
    'name': name,
    'time': TimeOfCreating,
  };

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['id'] as String,
      map['username'] as String, // Дивись, щоб ключ збігався з назвою колонки в БД
      map['time_of_creating'] as DateTime,
      map['password'] as String,
    );
  }
}