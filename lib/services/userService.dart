import 'package:News_Detective/common/Repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:News_Detective/models/userModel.dart';

class UserService {
  Repository _rep = Repository("user");
  final db = FirebaseFirestore.instance.collection("user");

  final String uid;
  UserService({this.uid});

  Future add(UserModel data) async {
    return await _rep.addDocument(data.toJson());
  }

  /*Future<UserDetail> getById(String userId) async {
    var result = await db.where("userId", isEqualTo: userId).getDocuments();
    if (result.documents.length == 0) return null;
    var user = result.documents.first;
    return UserDetail.fromMap(user, user.documentID);
  }*/

}
