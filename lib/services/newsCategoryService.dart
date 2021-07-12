import 'package:news_detective/common/Repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_detective/models/newsCategory.dart';

class NewsCategoryService{
  Repository _rep = Repository("news_category");
  final db = FirebaseFirestore.instance.collection("news_category");

  Future add(NewsCategory data) async {
    return await _rep.addDocument(data.toJson());
  }

}