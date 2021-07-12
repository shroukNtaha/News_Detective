class Notification{
  String id;
  String userId;
  String content;
  DateTime date;

  Notification({
    this.userId,
    this.content,
  });

  toJson() {
    return {
      "userId": userId,
      "content": content,
      "date": DateTime.now(),
    };
  }

  Notification.fromMap(snapshot, id)
      : id = id ?? '',
        userId = snapshot['userId'] ?? '',
        content = snapshot['content'] ?? '',
        date = snapshot['date'].toDate() ?? '';
}