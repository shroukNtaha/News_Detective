import 'package:News_Detective/screens/authenticate/authenticate.dart';
import 'package:News_Detective/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF2B475D),
          title: Text('News Detective'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.exit_to_app),
              textColor: Colors.white,
              label: Text('Signout'),
              onPressed: ()async {
                await _auth.signOut();
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Authenticate()),
                );
              },
            ),
          ],
      ),
      body: Container(
        child: Column(
          children: [

          ],
        ),
      ), 
    );
  }
}