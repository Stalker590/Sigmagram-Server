class Messenge {
  final String id;
  final String senderId; 
  final DateTime timeOfCreating;
  final String text;
  final String chatId;

  Messenge({
    required this.id,
    required this.senderId,
    required this.timeOfCreating,
    required this.text,
    required this.chatId,
  });

  factory Messenge.fromMap(Map<String, dynamic> map) {
    final time = map['time_of_creating'];
    return Messenge(
      id: map['id'] as String,
      senderId: map['sender_id'] as String,
      text: map['text'] as String,
      timeOfCreating: time is DateTime ? time : DateTime.parse(time.toString()),
      chatId: map['chat_id'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'sender_id': senderId,
        'text': text,
        'time_of_creating': timeOfCreating.toIso8601String(),
        'chat_id': chatId,
      };
}