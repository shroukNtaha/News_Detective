class User {
  String id;
  String name;
  String email;
  String userId;
  DateTime createdOn;
  String gender;
  String rangeAge;

  User({
    this.email,
    this.name,
    this.userId,
    this.gender,
    this.rangeAge,
  });

  toJson() {
    return {
      "userId": userId,
      "name": name,
      "email": email,
      "createdOn": DateTime.now(),
      "gender": gender,
      "rangeAge": rangeAge,
    };
  }

  User.fromMap(snapshot, id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        userId = snapshot['userId'] ?? '',
        createdOn = snapshot['createdOn'].toDate() ?? '',
        email = snapshot['email'] ?? '',
        gender = snapshot['gender'] ?? '',
        rangeAge = snapshot['rangeAge'] ?? '';

}