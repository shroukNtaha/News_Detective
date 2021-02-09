class UserModel {
  String id;
  String name;
  String email;
  String userId;
  DateTime createdOn;
  bool isActive;

  UserModel({
    this.email,
    this.name,
    this.userId,
  });

  toJson() {
    return {
      "userId": userId,
      "name": name,
      "email": email,
      "createdOn": DateTime.now(),
      "isActive": true,
    };
  }

  UserModel.fromMap(snapshot, id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        userId = snapshot['userId'] ?? '',
        createdOn = snapshot['createdOn'].toDate() ?? '',
        email = snapshot['email'] ?? '',
        isActive = snapshot['isActive'] ?? '';

}