import 'package:flutter/material.dart';
import 'package:news_detective/models/user.dart';
import 'package:news_detective/services/userService.dart';
import 'package:news_detective/themes/input.dart';
import 'package:news_detective/widget/appBar.dart';
import 'package:news_detective/widget/drawer.dart';
import 'profile_screen.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class UpdateScreen extends StatefulWidget {
  final User user;
  const UpdateScreen({Key key, this.user}) : super(key: key);
  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  String name = '';
  String rangeAge;
  String gender;
  List<String> rangeAgeList = [
    '15-25',
    '26-35',
    '36-45',
    '46-55',
    '56-65',
    '66'
  ];
  List<String> genderList = ['Male', 'Female', 'Other'];
  @override
  void initState() {
    super.initState();
    name = widget.user.name;
    rangeAge = widget.user.rangeAge;
    gender = widget.user.gender;
    print(widget.user.name);
  }

  UserService _userService = UserService();
  void updateUserData(User user) async {
    _userService.update(user, widget.user.id);
  }

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
                      decoration: textInputDecoration.copyWith(
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField<String>(
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Select Age Range',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      value: rangeAge,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      elevation: 16,
                      onChanged: (String value) {
                        setState(() {
                          rangeAge = value;
                        });
                      },
                      items: rangeAgeList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Select Gender',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      value: gender,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      elevation: 16,
                      onChanged: (String value) {
                        setState(() {
                          gender = value;
                        });
                      },
                      items: genderList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              Center(
// ignore: deprecated_member_use
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
                  onPressed: () async {
                    User userUpdate = User(
                        email: widget.user.email,
                        rangeAge: rangeAge,
                        name: name,
                        gender: gender,
                        userId: widget.user.userId,
                        notification: widget.user.notification);
                    updateUserData(userUpdate);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
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
