import 'package:news_detective/common/Repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_detective/models/news.dart';

import 'package:http/http.dart' as http ;
import 'dart:convert';

const kAPIkey = "ddd584655331475388eb27ed2de64898";
const kurl = "https://newsapi.org/v2/top-headlines?";
//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$kAPIkey

class NewsService {

  Future <List<dynamic>> getNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=$kAPIkey";
    http.Response response = await http.get(Uri.parse(url)) ;
    if (response.statusCode == 200){
      var news = response.body;
      //int totalResults = jsonDecode(news)['totalResults'];
      List<dynamic> newsbody = jsonDecode(news)['articles'];
      return newsbody;
    }
    return null;
  }

  Repository _rep = Repository("news");
  final db = FirebaseFirestore.instance.collection("news");

  Future add(News data) async {
    return await _rep.addDocument(data.toJson());
  }


}