import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_detective/themes/input.dart';
import 'package:news_detective/widget/appBar.dart';
import 'package:news_detective/widget/drawer.dart';
import 'package:news_detective/screens/home/home.dart';
import 'package:news_detective/models/news.dart';
import 'package:news_detective/services/newsService.dart';
import 'package:news_detective/common/loading.dart';

class Category extends StatefulWidget {
  final categoryName;
  Category(this.categoryName);
  @override
  _CategoryState createState() => _CategoryState(categoryName);
}

class _CategoryState extends State<Category> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  // ignore: deprecated_member_use
  List<String> newsTitle = List<String>();
  String selectedNews = "";
  List<News> filteredNews;

  searchByKeyword(String title) {
    if (title != "") {
      this.setState(() {
        filteredNews = news.where((element) => element.title.toLowerCase().contains(title.toLowerCase())).toList();
        print(news.length);
        print(filteredNews.length);
      });
    } else {
      this.setState(() {
        filteredNews = news;
      });
    }
  }

  final cat;
  _CategoryState(this.cat);
  NewsService _newsService = NewsService();
  List<News> news;
  void getNewsCategory() async {
    if (mounted) { 
      setState (() => loading = true);
    }
    if (news == null) loading = true;
    if (cat != 'Others') {
      _newsService
          .getByCategory(cat.toString().toLowerCase())
          .then((value) => this.setState(() {
                news = value;
                filteredNews = news;
                loading = false;
              }));
    } else {
      await _newsService
          .getByCategory('science')
          .then((value) => this.setState(() {
                news = value;
                filteredNews = news;
              }));
      await _newsService
          .getByCategory('world')
          .then((value) => this.setState(() {
                news = news + value;
                filteredNews = news;
                loading = false;
              }));
    }

    if(news != null){
      setState(() {
        for(News val in news) {
          newsTitle.add(val.title);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getNewsCategory();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            key: scaffoldKey,
            drawer: DrawerHome(),
            body: SafeArea(
              child: Column(
                children: [
                  Appbar(
                    keyDrawer: scaffoldKey,
                    active: cat,
                  ),
                  Container(
                    //color: Color(0xffA755BC),
                    height: 45,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 8,
                            child: Container(
                              height: 35,
                              child: SimpleAutoCompleteTextField(
                                key: key,
                                decoration: decor,
                                /*decoration: new InputDecoration(
                                  contentPadding: EdgeInsets.all(8.0),
                                  hintText: "Search",
                                  suffixIcon: new Icon(Icons.search),
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),*/
                                controller: TextEditingController(text: ""),
                                suggestions: newsTitle,
                                textChanged: (text) {
                                  searchByKeyword(text);
                                  setState(() {
                                    selectedNews = text;
                                  });
                                },
                                clearOnSubmit: false,
                                onFocusChanged: (value) {
                                  return null;
                                },
                                textSubmitted: (text) {
                                  searchByKeyword(text);
                                  setState(() {
                                    selectedNews = text;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              Icons.search,
                              size: 40.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [for (var i in filteredNews) NewsCard(i)]),
                  ),
                ],
              ),
            ),
          );
  }
}
