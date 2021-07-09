import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_detective/widget/appBar.dart';
import 'package:news_detective/widget/drawer.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool _switchValue1 = true;
  bool _switchValue2 = true;
  bool _switchValue3 = true;
  bool _switchValue4 = true;
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
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "Notification",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sport",style: TextStyle(fontSize: 25.0),),
                  CupertinoSwitch(
                    value: _switchValue1,
                    onChanged: (value) {
                      setState(() {
                        _switchValue1 = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Politics",style: TextStyle(fontSize: 25.0),),
                  CupertinoSwitch(
                    value: _switchValue2,
                    onChanged: (value) {
                      setState(() {
                        _switchValue2 = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Art",style: TextStyle(fontSize: 25.0),),
                  CupertinoSwitch(
                    value: _switchValue3,
                    onChanged: (value) {
                      setState(() {
                        _switchValue3 = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Health",style: TextStyle(fontSize: 25.0),),
                  CupertinoSwitch(
                    value: _switchValue4,
                    onChanged: (value) {
                      setState(() {
                        _switchValue4 = value;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
