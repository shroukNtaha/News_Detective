class NotificationOLD {
  String id;
  String userId;
  String content;
  DateTime date;

  NotificationOLD({
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

  NotificationOLD.fromMap(snapshot, id)
      : id = id ?? '',
        userId = snapshot['userId'] ?? '',
        content = snapshot['content'] ?? '',
        date = snapshot['date'].toDate() ?? '';
}
