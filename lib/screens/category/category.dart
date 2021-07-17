import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_detective/common/loading.dart';
import 'package:news_detective/main.dart';
import 'package:flutter/material.dart';
import 'package:news_detective/widget/appBar.dart';
import 'package:news_detective/widget/drawer.dart';
import 'package:news_detective/screens/home/home.dart';
import 'package:news_detective/models/news.dart';
import 'package:news_detective/services/newsService.dart';

class Category extends StatefulWidget {
  final categoryName;
  Category(this.categoryName);
  @override
  _CategoryState createState() => _CategoryState(categoryName);
}

class _CategoryState extends State<Category> {
  final cat;
  _CategoryState(this.cat);
  NewsService _newsService = NewsService();
  List<News> news;
  void getNewsCategory() async {
    if (cat != 'Others') {
      await _newsService
          .getByCategory(cat.toString().toLowerCase())
          .then((value) => this.setState(() {
                news = value;
              }));
    } else {
      await _newsService
          .getByCategory('science')
          .then((value) => this.setState(() {
                news = value;
              }));
      await _newsService
          .getByCategory('world')
          .then((value) => this.setState(() {
                news = news + value;
              }));
    }

    print(news[1].category);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Expanded(
              flex: 5,
              child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [for (var i in news) NewsCard(i)]),
            ),
          ],
        ),
      ),
    );
  }
}
