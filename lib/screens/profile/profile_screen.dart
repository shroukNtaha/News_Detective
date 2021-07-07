import 'package:flutter/material.dart';
import 'package:news_detective/widget/appBar.dart';
import 'package:news_detective/widget/drawer.dart';
import 'update_screen.dart';
import 'package:news_detective/screens/home/home.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ProfileScreen extends StatelessWidget {
  String name = 'sara';
  String email = 'sara@gmail.com';
  String rangeAge = '22';
  String gender = 'Female';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer:DrawerHome(),
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Appbar(keyDrawer: _scaffoldKey,),
          // AppBar(categories: [
          //    CategoryButton('Sports'),
          //    CategoryButton('Politics'),
          //    CategoryButton('Arts'),
          //    CategoryButton('Health'),
          //    CategoryButton('Others'),
          //  ]),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      " Name: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    Text(
                      name,
                      style: TextStyle(fontSize: 28.0),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      " Email: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    Text(
                      email,
                      style: TextStyle(fontSize: 28.0),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      " Age: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    Text(
                      rangeAge,
                      style: TextStyle(fontSize: 28.0),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      " Gender: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    Text(
                      gender,
                      style: TextStyle(fontSize: 28.0),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 30.0),
          Center(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                //side: BorderSide(color: Color(0xffA755BC)),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 110.0),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpdateScreen()));
              },
              color: Color(0xffA755BC),
              child: Text(
                'Edit Profile',
                style: TextStyle(color: Colors.white, fontSize: 35.0),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
