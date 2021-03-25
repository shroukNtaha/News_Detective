import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: new BoxDecoration(color: Colors.white),
          child: Column(children: <Widget>[
            SizedBox(height: 150.0),
            SizedBox(height: 15.0),
            /*Text(
              '"If you intersted to read news"',
              style: TextStyle(
                  color: Color(0xff16071e),
                  fontSize: 17.0,
                  //fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),*/
            SizedBox(height: 75.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xff6200EE),
                padding: EdgeInsets.all(15.0),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
              ), 
              onPressed: () { 
                Navigator.of(context).pushReplacementNamed("/signup");
              },
              child: Text(
                'Create a new account',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: 25.0, fontFamily: 'Georgia', height: 1),
              ),
            ),
            SizedBox(height: 75.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xff6200EE),
                padding: EdgeInsets.all(15.0),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
              ), 
              onPressed: () { 
                Navigator.of(context).pushReplacementNamed("/home");
              },
              child: Text(
                'Go Home',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: 25.0, fontFamily: 'Georgia', height: 1),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Have an Account? ",
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Georgia',
                          color: Color(0xff3700B3)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed("/login");
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 27.0,
                            fontFamily: 'Georgia',
                            color: Color(0xff16071e),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ])),
    );
  }
}