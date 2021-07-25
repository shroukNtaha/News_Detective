import 'package:flutter/material.dart';
import 'package:news_detective/screens/authenticate/authenticate.dart';
import 'package:news_detective/screens/notification/notification.dart';
import 'package:news_detective/screens/profile/profile_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news_detective/services/authService.dart';

class DrawerHome extends StatefulWidget {
  @override
  _DrawerHomeState createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  bool visiblity = false;
  AuthService _auth = AuthService();
  bool _isVisible = false;
  String userId;
  void getCurrentUser() async {
    try {
      userId = await AuthService().getCurrentUser();
      if (userId != null) {
        setState(() {
          visiblity = true;
        });
      }
    } catch (e) {
      setState(() {
        visiblity = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Widget build(BuildContext context) {
    return Drawer(
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
          Visibility(
            child: ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 35.0,
              ),
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 23.0),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            visible: visiblity,
          ),
          Visibility(
            child: ListTile(
              leading: Icon(
                Icons.alarm,
                size: 35.0,
              ),
              title: Text(
                'Notification',
                style: TextStyle(fontSize: 23.0),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notifications()));
              },
            ),
            visible: visiblity,
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.info /*contact_support*/,
          //     size: 35.0,
          //   ),
          //   title: Text(
          //     'About us',
          //     style: TextStyle(fontSize: 23.0),
          //   ),
          // ),
          ListTile(
            leading: Icon(
              Icons.contact_mail,
              size: 35.0,
            ),
            title: Text(
              'Contact us',
              style: TextStyle(fontSize: 23.0),
            ),
            onTap: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
          ),
          Visibility(
            visible: _isVisible,
            child: GestureDetector(
              onTap: () => launch("tel://01100095063"),
              child: Card(
                child: new ListTile(
                  leading: Icon(
                    Icons.call,
                    size: 35.0,
                  ),
                  title: Text(
                    '01100095063',
                    style: TextStyle(fontSize: 23.0),
                  ),
                ),
              ),
            ),
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.feedback,
          //     size: 35.0,
          //   ),
          //   title: Text(
          //     'Help & feedback',
          //     style: TextStyle(fontSize: 23.0),
          //   ),
          // ),
          Visibility(
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app /*logout*/,
                size: 35.0,
              ),
              title: Text(
                'Signout',
                style: TextStyle(fontSize: 23.0),
              ),
              onTap: () async {
                await _auth.signOut();
                //Navigator.of(context).pushNamed(pageName);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Authenticate()),
                );
              },
            ),
            visible: visiblity,
          ),
          Visibility(
            child: SizedBox(height: 50.0),
            visible: !visiblity,
          ),
          Visibility(
            child: ListTile(
              leading: Icon(
                Icons.switch_account,
                size: 35.0,
              ),
              title: Text(
                'REGISTER',
                style: TextStyle(fontSize: 25.0, color: Color(0xffA755BC)),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Authenticate()),
                );
              },
            ),
            visible: !visiblity,
          ),
        ],
      ),
    );
  }
}
