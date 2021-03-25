import 'package:http/http.dart' as http ;
import 'dart:convert';

const kAPIkey = "ddd584655331475388eb27ed2de64898";
const kurl = "https://newsapi.org/v2/top-headlines?";
//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$kAPIkey

class APIService{

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



}