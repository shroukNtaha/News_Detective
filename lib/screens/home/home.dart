import 'package:news_detective/common/loading.dart';
import 'package:news_detective/screens/authenticate/authenticate.dart';
import 'package:news_detective/services/newsService.dart';
import 'package:news_detective/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  getdata()async{
    //////////////
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '10.0.2.2', port: 8080, user: 'root',password: 'root', db: 'detect_news'));
    // Create a table
    await conn.query(
      'CREATE TABLE users (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(255), email varchar(255), age int)');

    // Insert some data
    var result = await conn.query(
      'insert into users (name, email, age) values (?, ?, ?)',
      ['Bob', 'bob@bob.com', 25]);
    print('Inserted row id=${result.insertId}');

    // Query the database using a parameterized query
    var results = await conn.query(
      'select name, email, age from users where id = ?', [result.insertId]);
    for (var row in results) {
      print('Name: ${row[0]}, email: ${row[1]} age: ${row[2]}');
    }
    await conn.close();
    ///////////////////
  }
  

  NewsService apiService = NewsService();
  void getNews()async{
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
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffA755BC),
        title: Text('News Detective',style: TextStyle(color: Colors.white,fontSize: 24.0),),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF2B475D),
              ),
              child: Text(
                'Fake News Detection',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
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
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
