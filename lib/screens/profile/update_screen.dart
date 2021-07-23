import 'package:flutter/material.dart';
import 'package:news_detective/models/user.dart';
import 'package:news_detective/services/userService.dart';
import 'package:news_detective/themes/input.dart';
import 'package:news_detective/widget/appBar.dart';
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
  String email = '';
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

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    name = widget.user.name;
    email = widget.user.email;
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
      //drawer: DrawerHome(),
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
                      // decoration: InputDecoration(
                      //   hintText: name,
                      //   hintStyle: TextStyle(color: Colors.grey),
                      //   contentPadding: EdgeInsets.symmetric(
                      //       vertical: 10.0, horizontal: 20.0),
                      //   focusedBorder: OutlineInputBorder(
                      //     borderSide:
                      //         BorderSide(color: Colors.black, width: 2.0),
                      //   ),
                      // ),
                    ),
                    /*SizedBox(height: 20.0),
                     TextFormField(
                      initialValue: email,
                      validator: (val) {
                        if (!val.contains('@')) {
                          return 'Enter valid email';
                        }
                        return null;
                      },
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
                    ),*/
                    SizedBox(height: 10.0),
                    /*DropdownButtonFormField<String>(
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
                    ),*/
                    DropdownButtonFormField<String>(
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Select Age Range',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      value: rangeAge,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      elevation: 16,
                      //validator: (val) => val == null ? 'Select your age range': null,
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
                      //validator: (val) => val == null ? 'Select your gender' : null,
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
                    //side: BorderSide(color: Color(0xffA755BC)),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
                  onPressed: () async {
                    // if (_formKey.currentState.validate()) {
                    User userUpdate = User(
                        email: email,
                        rangeAge: rangeAge,
                        name: name,
                        gender: gender,
                        userId: widget.user.userId);
                    updateUserData(userUpdate);
                    // Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                    //}
                    //  } else print("Not Valide Email");
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
