import 'package:news_detective/common/loading.dart';
import 'package:news_detective/screens/authenticate/authenticate.dart';
import 'package:news_detective/services/newsService.dart';
import 'package:news_detective/services/auth.dart';
import 'package:flutter/material.dart';
//import 'package:mysql1/mysql1.dart';
import 'package:news_detective/themes/input.dart';
import 'package:news_detective/screens/profile/profile_screen.dart';
import 'package:news_detective/screens/detectPage/DetectPage.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryButton> categories = [
    CategoryButton('Sports'),
    CategoryButton('Politics'),
    CategoryButton('Arts'),
    CategoryButton('Health'),
    CategoryButton('Others'),
  ];

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
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            key: _scaffoldKey,
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xffA755BC),
                    ),
                    child: Image(
                      image: AssetImage("assets/detictive_news.jpeg"),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Profile'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                  ListTile(
                    leading: Icon(Icons.info /*contact_support*/),
                    title: Text('About us'),
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_mail),
                    title: Text('Contact us'),
                  ),
                  ListTile(
                    leading: Icon(Icons.feedback),
                    title: Text('Help & feedback'),
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app /*logout*/),
                    title: Text('Signout'),
                    onTap: () async {
                      await _auth.signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Authenticate()),
                      );
                    },
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  AppBar(categories: categories),
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

class AppBar extends StatelessWidget {
  const AppBar({
    Key key,
    @required this.categories,
  }) : super(key: key);

  final List<CategoryButton> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Color(0xffA755BC),
          height: 150,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset('assets/detictive_news.jpeg'),
            ],
          ),
        ),
        Container(
          color: Color(0xffA755BC),
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 8,
                  child: TextField(
                    cursorColor: Colors.black,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                    onChanged: null,
                    decoration: decor,
                  ),
                ),
                Expanded(
                  child: Icon(Icons.search),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          color: Color(0xffA755BC),
          height: 60,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: categories,
          ),
        ),
        Container(
          color: Color(0xffA755BC),
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: FlatButton(
                  color: Colors.white,
                  height: 60,
                  onPressed: () {},
                  child: Text(
                    'Home',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  height: 60,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetectPage()));
                  },
                  child: Text(
                    'Detect News',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
