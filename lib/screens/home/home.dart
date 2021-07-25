import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:news_detective/common/loading.dart';
import 'package:news_detective/main.dart';
import 'package:news_detective/models/news.dart';
import 'package:news_detective/services/newsService.dart';
import 'package:flutter/material.dart';
import 'package:news_detective/themes/input.dart';
import 'package:news_detective/widget/appBar.dart';
import 'package:news_detective/widget/drawer.dart';
import 'package:news_detective/screens/article/article.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  NewsService apiService = NewsService();
  void getNews() async {
    List<dynamic> news = await apiService.getNews();
    print(news);
  }

  NewsService _newsService = NewsService();
  List<News> news;
  List<News> newsnews;

  void getdata() async {
    if (mounted) { 
      setState (() => loading = true);
    }
    if (news == null) loading = true;
    await _newsService.get().then((value) => this.setState(() {
      news = value;
      filteredNews = value;
      loading = false;
    }));
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

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body)],
                  ),
                ),
              );
            });
      }
    });
    //getNews();
    getdata();
    //getNewsCategory();
    if (news != null) Navigator.pop(context);
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : MaterialApp(
          home: Scaffold(
              backgroundColor: Colors.white,
              key: scaffoldKey,
              drawer: DrawerHome(),
              body: SafeArea(
                child: Column(
                  children: [
                    Appbar(
                      keyDrawer: scaffoldKey,
                      active: 'Home',
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
                      // child: Container(
                      //   //height: 45.0,
                      //   width: 220.0,
                      //   child: SimpleAutoCompleteTextField(
                      //     key: key,
                      //     decoration: new InputDecoration(
                      //       contentPadding: EdgeInsets.all(8.0),
                      //       hintText: "Search",
                      //       suffixIcon: new Icon(Icons.search),
                      //       hintStyle: TextStyle(color: Colors.grey),
                      //     ),
                      //     controller: TextEditingController(text: ""),
                      //     suggestions: newsTitle,
                      //     textChanged: (text) {
                      //       searchByKeyword(text);
                      //       setState(() {
                      //         selectedNews = text;
                      //       });
                      //     },
                      //     clearOnSubmit: false,
                      //     onFocusChanged: (value) {
                      //       return null;
                      //     },
                      //     textSubmitted: (text) {
                      //       searchByKeyword(text);
                      //       setState(() {
                      //         selectedNews = text;
                      //       });
                      //     },
                      //   ),
                      //  ),
                    Expanded(
                      flex: 5,
                      child: ListView(
                        //itemCount: this.filteredNews == null ? 0 : this.filteredNews.length,
                          scrollDirection: Axis.vertical,
                          children: [for (var i in filteredNews) NewsCard(i)]),
                    ),
                  ],
                ),
              ),
            ),
        );
  }
}

class NewsCard extends StatelessWidget {
  final News news;
  NewsCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color(0xFFd5d5d5),
        child: InkWell(
          splashColor: Colors.purple.withAlpha(30),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Article(news)));
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: SizedBox(
              width: 200,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      news.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: news.label == 'REAL' ? Colors.green : Colors.red,
                        borderRadius: new BorderRadius.circular(20),
                      ),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          news.label,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final categoryName;

  CategoryButton(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      // ignore: deprecated_member_use
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.grey)),
        color: Colors.white,
        onPressed: () {},
        child: Text(
          categoryName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
