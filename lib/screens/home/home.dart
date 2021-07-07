import 'package:news_detective/common/loading.dart';
import 'package:news_detective/services/newsService.dart';
import 'package:flutter/material.dart';
import 'package:news_detective/widget/appBar.dart';
//import 'package:mysql1/mysql1.dart';
import 'package:news_detective/widget/drawer.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  // getdata()async{
  //   //////////////
  //   final conn = await MySqlConnection.connect(ConnectionSettings(
  //     host: '10.0.2.2', port: 8080, user: 'root',password: 'root', db: 'detect_news'));
  //   // Create a table
  //   await conn.query(
  //     'CREATE TABLE users (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(255), email varchar(255), age int)');
  //
  //   // Insert some data
  //   var result = await conn.query(
  //     'insert into users (name, email, age) values (?, ?, ?)',
  //     ['Bob', 'bob@bob.com', 25]);
  //   print('Inserted row id=${result.insertId}');
  //
  //   // Query the database using a parameterized query
  //   var results = await conn.query(
  //     'select name, email, age from users where id = ?', [result.insertId]);
  //   for (var row in results) {
  //     print('Name: ${row[0]}, email: ${row[1]} age: ${row[2]}');
  //   }
  //   await conn.close();
  //   ///////////////////
  // }

  NewsService apiService = NewsService();
  void getNews() async {
    List<dynamic> news = await apiService.getNews();
    print(news);
  }

  @override
  void initState() {
    super.initState();
    getNews();
    //getdata();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            key: _scaffoldKey,
            drawer:DrawerHome(),
            body: SafeArea(
              child: Column(
                children: [
                  Appbar(keyDrawer: _scaffoldKey,)
                  // ListView(
                  //   scrollDirection: Axis.vertical,
                  //   children: [],
                  // ),
                ],
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
