import 'package:flutter/material.dart';
import 'package:news_detective/models/user.dart';
import 'package:news_detective/services/authService.dart';
import 'package:news_detective/services/userService.dart';
import 'package:news_detective/widget/appBar.dart';
import 'package:news_detective/widget/drawer.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'profile_screen.dart';
import 'package:loading/loading.dart';

//User user = FirebaseAuth.instance.currentUser;

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class UpdateScreen extends StatefulWidget {
  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

String name = '';
String email = '';
String rangeAge = '';
String gender = '';

class _UpdateScreenState extends State<UpdateScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  UserService _userService = UserService();
  AuthService _auth = AuthService();
  void updateUserData() async {
    String userId = await _auth.getCurrentUser();
    User user = await _userService.getByUserId(userId);
    _userService.update(user, userId);
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

  // bool loading = false;
  // // String email = user.email;
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

  // var update = FirebaseFirestore.instance
  //     .collection('user')
  //     .doc(user.uid)
  //     .update({
  //   "name": name,
  //   "email": email,
  //   "gender": gender,
  //   "rangeAge": rangeAge
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: DrawerHome(),
      body: SafeArea(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Appbar(
                keyDrawer: _scaffoldKey,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: name,
                      onChanged: (String value) {
                        setState(() {
                          name = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: name,
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: email,
                      // validator: (val) {
                      //   if (!val.contains('@')) {
                      //     return 'Enter valid email';
                      //   }
                      //   return null;
                      // },
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: email,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: rangeAge,
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                      value: rangeAge,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      elevation: 16,
                      hint: Text('Select Age Range'),
                      validator: (val) => val == 'Select Age Range'
                          ? 'Select your Age Range'
                          : null,
                      items: <String>[
                        'Select Age Range',
                        '15-25',
                        '26-35',
                        '36-45',
                        '46-55',
                        '56-65',
                        '66'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          rangeAge = value;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: gender,
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                      value: gender,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      elevation: 16,
                      hint: Text('Select Gender'),
                      validator: (val) =>
                          val == 'Select Gender' ? 'Select your Gender' : null,
                      items: <String>[
                        'Select Gender',
                        'Male',
                        'Female',
                        'Other'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              Center(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    //side: BorderSide(color: Color(0xffA755BC)),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
                  onPressed: () async {
                    // if (_formKey.currentState.validate()) {
                    //   setState(() {
                    //     loading = true;
                    //   });
                    //   FirebaseFirestore.instance
                    //       .collection("user")
                    //       .where("userId", isEqualTo: user.uid)
                    //       .get()
                    //       .then((QuerySnapshot querySnapshot) {
                    //     querySnapshot.docs.forEach((doc) {
                    //       doc.reference.update({
                    //         //"name": 'ooooooo',
                    //         "name": name,
                    //         "email": email,
                    //         "gender": gender,
                    //         "rangeAge": rangeAge
                    //       });
                    //     });
                    //   });
                    //   user.updateEmail(email);

                    // updateUserData();

                    UserService _userService = UserService();
                    AuthService _auth = AuthService();
                    String userId = await _auth.getCurrentUser();
                    User user = await _userService.getByUserId(userId);
                    print("--------------");
                    print(userId);
                    print(user.name);
                    print("--------------");

                    _userService.update(user, userId);
                    // Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                    // }
                  },
                  color: Color(0xffA755BC),
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
