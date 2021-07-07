import 'package:flutter/material.dart';
import 'package:news_detective/themes/input.dart';
import 'package:news_detective/widget/appBar.dart';
import 'package:news_detective/widget/drawer.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class UpdateScreen extends StatelessWidget {
  String name = 'sara';
  String email = 'sara@gmail.com';
  String error = '';
  String rangeAge = 'Select Age Range';
  String gender = 'Select Gender';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer:DrawerHome(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Appbar(keyDrawer: _scaffoldKey,),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: name,
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      decoration: InputDecoration(
                        hintText: email,
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                    ),
                  ],
                ),
        ),

              SizedBox(height: 20.0),
              // range of age list
              SizedBox(height: 20.0),
              // male/ female list
              SizedBox(height: 50.0),
              Center(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    //side: BorderSide(color: Color(0xffA755BC)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Color(0xffA755BC),
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white, fontSize: 35.0),
                  ),
                ),
              ),
            ],
          ),
    ));
  }
}
