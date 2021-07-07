import 'package:flutter/material.dart';
import 'package:news_detective/themes/input.dart';

class UpdateScreen extends StatelessWidget {
  String name = 'sara';
  String email = 'sara@gmail.com';
  String error = '';
  String rangeAge = 'Select Age Range';
  String gender = 'Select Gender';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            SizedBox(height: 20.0),
            // range of age list
            SizedBox(height: 20.0),
            // male/ female list
            SizedBox(height: 50.0),
            FlatButton(
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
          ],
        ),
      ),
    ));
  }
}
