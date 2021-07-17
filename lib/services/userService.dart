import 'package:news_detective/common/Repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_detective/models/user.dart';

class UserService {
  Repository _rep = Repository("user");
  final db = FirebaseFirestore.instance.collection("user");

  final String uid;
  UserService({this.uid});

  Future add(User data) async {
    return await _rep.addDocument(data.toJson());
  }

  Future<User> getByUserId(String userId) async {
    var result = await db.where("userId", isEqualTo: userId).get();
    if (result.docs.length == 0) return null;
    var user = result.docs.first;
    return User.fromMap(user, user.id);
  }

  void update(User data, String documentId) async {
    return await _rep.updateDocument(data.toJson(), documentId);
  }


}
