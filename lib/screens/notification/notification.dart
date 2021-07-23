import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_detective/models/user.dart';
import 'package:news_detective/services/authService.dart';
import 'package:news_detective/services/userService.dart';
import 'package:news_detective/widget/appBar.dart';
import 'package:news_detective/widget/drawer.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  User user;

  bool _sport = false;
  bool _politics = false;
  bool _entertainment = false;
  bool _health = false;
  bool _technology = false;

  void getUserData() async {
    String userId = await AuthService().getCurrentUser();
    user = await UserService().getByUserId(userId);
  }

  UserService _userService = UserService();
  void updateUserData(User _user) async {
    setState(() {
      user.notification
          .contains(NotificationModel(category: "sport", status: _sport));
      user.notification
          .contains(NotificationModel(category: "politics", status: _politics));
      user.notification.contains(
          NotificationModel(category: "entertainment", status: _entertainment));
      user.notification
          .contains(NotificationModel(category: "health", status: _health));
      user.notification.contains(
          NotificationModel(category: "technology", status: _technology));
      _userService.update(_user, user.id);
    });
    _userService.update(_user, user.id);
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerHome(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Appbar(
              keyDrawer: _scaffoldKey,
            ),
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
                  Text(
                    "Sport",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  CupertinoSwitch(
                    value: _sport,
                    onChanged: (value) {
                      setState(() {
                        _sport = value;
                        updateUserData(user);
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
                  Text(
                    "Politics",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  CupertinoSwitch(
                    value: _politics,
                    onChanged: (value) {
                      setState(() {
                        _politics = value;
                        updateUserData(user);
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
                  Text(
                    "Health",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  CupertinoSwitch(
                    value: _health,
                    onChanged: (value) {
                      setState(() {
                        _health = value;
                        updateUserData(user);
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
                  Text(
                    "Entertainment",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  CupertinoSwitch(
                    value: _entertainment,
                    onChanged: (value) {
                      setState(() {
                        _entertainment = value;
                        updateUserData(user);
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
                  Text(
                    "Technology",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  CupertinoSwitch(
                    value: _technology,
                    onChanged: (value) {
                      setState(() {
                        _technology = value;
                        updateUserData(user);
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
