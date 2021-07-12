class ActiveNotificationCategory{
  String id;
  String userId;
  String categoryId;

  ActiveNotificationCategory({
    this.userId,
    this.categoryId,
  });

  toJson() {
    return {
      "userId": userId,
      "categoryId": categoryId,
    };
  }

  ActiveNotificationCategory.fromMap(snapshot, id)
      : id = id ?? '',
        userId = snapshot['userId'] ?? '',
        categoryId = snapshot['categoryId'] ?? '';
}