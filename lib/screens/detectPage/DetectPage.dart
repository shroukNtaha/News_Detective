import 'package:flutter/material.dart';
import 'package:news_detective/widget/appBar.dart';
import 'package:news_detective/widget/drawer.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
class DetectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        drawer:DrawerHome(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Appbar(keyDrawer: _scaffoldKey,),
              // ListView(
              // children: [
              Expanded(
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      cursorColor: Color(0xffA755BC),
                      //  minLines: 30,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration.collapsed(
                          hintText: "Enter the news you want to detect here"),
                    ),
                  ),
                ),
              ),
              //],
              //),
              SizedBox(height: 50.0),
              Center(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    //side: BorderSide(color: Color(0xffA755BC)),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 110.0),
                  onPressed: () {},
                  color: Color(0xffA755BC),
                  child: Text(
                    'Detect',
                    style: TextStyle(color: Colors.white, fontSize: 35.0),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
            ],
          ),
        ));
  }
}
