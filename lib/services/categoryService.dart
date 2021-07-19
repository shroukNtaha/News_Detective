import 'package:news_detective/common/Repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_detective/models/category.dart';

class CategoryService {
  Repository _rep = Repository("category");
  final db = FirebaseFirestore.instance.collection("category");

  Future add(Category data) async {
    return await _rep.addDocument(data.toJson());
  }

  
}