import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffA755BC),
      body: Center(
        child: Container(
            //decoration: new BoxDecoration(color: Color(0xffA755BC)),
            child: Column(children: <Widget>[
              SizedBox(height: 100.0),
              Image(
                image: AssetImage("assets/detictive_news.jpeg"),
              ),
              SizedBox(height: 50.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black,
                  //padding: EdgeInsets.fromLTRB(100.0,20.0, 100.0, 20.0),
                  minimumSize: Size(230.0, 70.0),
                  shape: new RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: new BorderRadius.circular(10.0)),
                ), 
                onPressed: () { 
                  Navigator.of(context).pushReplacementNamed("/signup");
                },
                child: Text(
                  'SIGN UP',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white , fontSize: 20.0, fontWeight: FontWeight.bold,/*fontFamily: 'Georgia', height: 1,*/),
                ),
              ),
              SizedBox(height: 25.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white,
                  //padding: EdgeInsets.fromLTRB(80.0,20.0, 80.0, 20.0),
                  minimumSize: Size(230.0, 70.0),
                  shape: new RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black , width: 2.5),
                    borderRadius: new BorderRadius.circular(10.0)),
                ), 
                onPressed: () { 
                  Navigator.of(context).pushReplacementNamed("/login");
                },
                child: Text(
                  'LOG IN',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black , fontSize: 20.0, fontWeight: FontWeight.bold,/*fontFamily: 'Georgia', height: 1,*/),
                ),
              ),
              SizedBox(height: 40.0),
              InkWell(
                child: new Text("TAKE ME TO NEWS" ,
                  style: TextStyle(fontSize: 20.0,decoration: TextDecoration.underline,
                    color: Colors.black,),),
                onTap: () => Navigator.of(context).pushReplacementNamed("/home") 
              ),
              /*GestureDetector(
                child: new Text("TAKE ME TO NEWS" ,
                  style: TextStyle(fontSize: 20.0,decoration: TextDecoration.underline,
                    color: Colors.black,),),
                onTap: () => Navigator.of(context).pushReplacementNamed("/home") 
              ),*/
            ])),
      ),
    );
  }
}