import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_detective/common/Repository.dart';
import 'package:news_detective/models/notification.dart';

class NotificationService {
  Repository _rep = Repository("notification");
  final db = FirebaseFirestore.instance.collection("notification");

  Future add(NotificationOLD data) async {
    return await _rep.addDocument(data.toJson());
  }
}
