class User {
  String id;
  String name;
  String email;
  String userId;
  DateTime createdOn;
  String gender;
  String rangeAge;
  List<NotificationModel> notification;

  User(
      {this.email,
      this.name,
      this.userId,
      this.gender,
      this.rangeAge,
      this.createdOn,
      this.notification});

  toJson() {
    return {
      "userId": userId,
      "name": name,
      "email": email,
      "createdOn": createdOn,
      "gender": gender,
      "rangeAge": rangeAge,
      "notification": notification.map((e) => e.toJson()).toList(),
    };
  }

  User.fromMap(snapshot, id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        userId = snapshot['userId'] ?? '',
        createdOn = snapshot['createdOn'].toDate() ?? '',
        email = snapshot['email'] ?? '',
        gender = snapshot['gender'] ?? '',
        rangeAge = snapshot['rangeAge'] ?? '',
        notification = snapshot['notification']
                .map<NotificationModel>((el) => NotificationModel.forMap(el))
                .toList() ??
            [];
}

class NotificationModel {
  String category;
  bool status;

  NotificationModel({this.category, this.status});

  toJson() {
    return {"category": category, "status": status};
  }

  List<NotificationModel> initState() {
    // ignore: deprecated_member_use
    List<NotificationModel> notifictaions = new List<NotificationModel>();

    notifictaions.add(new NotificationModel(category: "sport", status: false));
    notifictaions
        .add(new NotificationModel(category: "politics", status: false));
    notifictaions
        .add(new NotificationModel(category: "entertainment", status: false));
    notifictaions.add(new NotificationModel(category: "health", status: false));
    notifictaions
        .add(new NotificationModel(category: "technology", status: false));

    return notifictaions;
  }

  NotificationModel.forMap(Map snapshot)
      : category = snapshot['category'] ?? '',
        status = snapshot['status'] ?? '';
}
