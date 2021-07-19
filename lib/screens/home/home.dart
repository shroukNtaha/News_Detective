import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:news_detective/common/loading.dart';
import 'package:news_detective/main.dart';
import 'package:news_detective/models/category.dart';
import 'package:news_detective/models/news.dart';
import 'package:news_detective/models/user.dart';
import 'package:news_detective/services/categoryService.dart';
import 'package:news_detective/services/newsService.dart';
import 'package:flutter/material.dart';
import 'package:news_detective/services/userService.dart';
import 'package:news_detective/widget/appBar.dart';
import 'package:news_detective/widget/drawer.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void addCategorys(){
    //'Sports','Politics','Arts','Health','Others',
    CategoryService _categoryService = CategoryService();
    List<Category> categorys ;
    categorys.add(Category(name: 'Sports'));
    categorys.add(Category(name: 'Politics'));
    categorys.add(Category(name: 'Arts'));
    categorys.add(Category(name: 'Health'));
    categorys.add(Category(name: 'Others'));
    for (var category in categorys) {
      _categoryService.add(category);
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
    _newsService.get().then((value) => 
      this.setState(() {
        newsnews = value;
    }));
  }

  void getNewsCategory() async {
    news = await _newsService.getByCategory('health');
    print(news[1].category);
  }

  UserService _userService = UserService();
  void getUserData() async {
    User user = await _userService.getByUserId('8OuDEcbFBDaXQWnndWrRH3tjVqy2');
    print(user.gender);
  }

  var _category = "Sport";
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
    getUserData();
    getNewsCategory();
  }

  void showNotification() {
    /*setState(() {
      _category = the category which have a new news
    });*/
    flutterLocalNotificationsPlugin.show(
        0,
        "You have new News in $_category",
        "Don't miss out on the news",
        NotificationDetails(
            android: AndroidNotificationDetails(
                channel.id, channel.name, channel.description,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            key: _scaffoldKey,
            drawer: DrawerHome(),
            body: SafeArea(
              child: Column(
                children: [
                  Appbar(
                    keyDrawer: _scaffoldKey,
                    active: 'Home',
                  ),
                  Expanded(
                    flex: 1,
                    // ignore: deprecated_member_use
                    child: FlatButton.icon(
                        onPressed: showNotification,
                        icon: Icon(Icons.access_alarm),
                        label: Text('Notification')),
                  ),
                  Expanded(
                    flex: 5,
                    child: ListView(scrollDirection: Axis.vertical, children: [
                      for (var i in newsnews) NewsCard(i.title, i.label)
                    ]),
                  ),
                ],
              ),
            ),
          );
  }
}

class NewsCard extends StatelessWidget {
  final newsTitle;
  final label;
  NewsCard(this.newsTitle, this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color(0xFFd5d5d5),
        child: InkWell(
          splashColor: Colors.purple.withAlpha(30),
          onTap: () {
            print('Card tapped.');
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
                      newsTitle,
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
                        color: label == 'REAL' ? Colors.green : Colors.red,
                        borderRadius: new BorderRadius.circular(20),
                      ),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        onPressed: (){},
                        child: Text(
                          label,
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
