import 'package:news_detective/common/Repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_detective/models/activeNotificationCategory.dart';


class ActiveNotificationCategoryService{
  Repository _rep = Repository("active_notification_category");
  final db = FirebaseFirestore.instance.collection("active_notification_category");

  Future add(ActiveNotificationCategory data) async {
    return await _rep.addDocument(data.toJson());
  }

}