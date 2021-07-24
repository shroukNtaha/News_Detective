import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationService {
  //Repository _rep = Repository("notification");
  final db = FirebaseFirestore.instance.collection("notification");

  Future add(NotificationOLD data) async {
    return await _rep.addDocument(data.toJson());
  }

}
