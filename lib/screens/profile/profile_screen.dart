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

String name = '';
String email = '';
String rangeAge = '';
String gender = '';

class _State extends State<ProfileScreen> {
  //AuthService _auth = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  User user;
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

// UserService _userService = UserService();

  // UserService _userService = UserService();

  // Future user = UserService().getByUserId(userId);
  // String email = user.email;

  // var query = FirebaseFirestore.instance
  //     .collection('user')
  //     .where("userId", isEqualTo: user.uid)
  //     .get()
  //     .then((QuerySnapshot querySnapshot) {
  //   querySnapshot.docs.forEach((doc) {
  //     name = doc["name"];
  //     email = doc["email"];
  //     rangeAge = doc["rangeAge"];
  //     gender = doc["gender"];
  //   });
  // });

  @override
  Widget build(BuildContext context) {
    // getUserData();

    print(email);

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
                            builder: (context) => UpdateScreen()));
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
