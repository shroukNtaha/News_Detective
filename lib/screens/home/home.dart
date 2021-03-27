import 'package:news_detective/screens/authenticate/authenticate.dart';
import 'package:news_detective/services/newsService.dart';
import 'package:news_detective/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  NewsService apiService = NewsService();
  void getNews()async{
    List<dynamic> news = await apiService.getNews();
    print(news);
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2B475D),
        title: Text('News Detective'),
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
