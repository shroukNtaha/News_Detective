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
  User updated;
  bool _sport = false;
  bool _politics = false;
  bool _entertainment = false;
  bool _health = false;
  bool _technology = false;
  List<NotificationModel> notificationCategory;

  void getUserData() async {
    String userId = await AuthService().getCurrentUser();
    user = await UserService().getByUserId(userId);
    notificationCategory = user.notification;

    setState(() {
      updated = user;
    });
    for (NotificationModel not in notificationCategory) {
      if (not.category == "sport") {
        setState(() {
          _sport = not.status;
        });
      } else if (not.category == "politics") {
        setState(() {
          _politics = not.status;
        });
      } else if (not.category == "entertainment") {
        setState(() {
          _entertainment = not.status;
        });
      } else if (not.category == "health") {
        setState(() {
          _health = not.status;
        });
      } else if (not.category == "technology") {
        setState(() {
          _technology = not.status;
        });
      }
    }
  }

  UserService _userService = UserService();
  void updateUserData(User _user) async {
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
                        for (NotificationModel not in notificationCategory) {
                          if (not.category == "sport") {
                            setState(() {
                              not.status = _sport;
                            });
                          }
                        }
                        updated.notification = notificationCategory;
                        updateUserData(updated);
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
                        for (NotificationModel not in notificationCategory) {
                          if (not.category == "politics") {
                            setState(() {
                              not.status = _politics;
                            });
                          }
                        }
                        updated.notification = notificationCategory;
                        updateUserData(updated);
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
                        for (NotificationModel not in notificationCategory) {
                          if (not.category == "health") {
                            setState(() {
                              not.status = _health;
                            });
                          }
                        }
                        updated.notification = notificationCategory;
                        updateUserData(updated);
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
                        for (NotificationModel not in notificationCategory) {
                          if (not.category == "entertainment") {
                            setState(() {
                              not.status = _entertainment;
                            });
                          }
                        }
                        updated.notification = notificationCategory;
                        updateUserData(updated);
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
                        for (NotificationModel not in notificationCategory) {
                          if (not.category == "technology") {
                            setState(() {
                              not.status = _technology;
                            });
                          }
                        }
                        updated.notification = notificationCategory;
                        updateUserData(updated);
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
