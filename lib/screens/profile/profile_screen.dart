import 'package:flutter/material.dart';
import 'package:news_detective/models/user.dart';
import 'package:news_detective/services/authService.dart';
import 'package:news_detective/widget/appBar.dart';
import 'package:news_detective/widget/drawer.dart';
import 'update_screen.dart';
import 'package:news_detective/services/userService.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ProfileScreen extends StatefulWidget {
  // final User user;

  @override
  _State createState() => _State();
}

class _State extends State<ProfileScreen> {
  User user;

  String name = '';
  String email = '';
  String rangeAge = '';
  String gender = '';

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    String userId = await AuthService().getCurrentUser();
    user = await UserService().getByUserId(userId);
    setState(() {
      name = user.name;
      email = user.email;
      rangeAge = user.rangeAge;
      gender = user.gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        drawer: DrawerHome(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Appbar(
                keyDrawer: _scaffoldKey,
              ),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.0),
                        ),
                        Expanded(
                          child: Text(
                            name,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text(
                          " Email: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.0),
                        ),
                        Expanded(
                          child: Text(
                            email,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text(
                          " Age: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.0),
                        ),
                        Text(
                          rangeAge,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text(
                          " Gender: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.0),
                        ),
                        Text(
                          gender,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Center(
                // ignore: deprecated_member_use
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    //side: BorderSide(color: Color(0xffA755BC)),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateScreen(user: user)));
                  },
                  color: Color(0xffA755BC),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
