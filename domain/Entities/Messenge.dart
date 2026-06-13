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
    return Messenge(
      id: map['id'] as String,
      senderId: map['sender_id'] as String,
      text: map['text'] as String,
      timeOfCreating: map['time_of_creating'] as DateTime,
      chatId: map['chat_id'] as String,
    );
  }
}