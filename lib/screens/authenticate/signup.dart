import 'package:loading/loading.dart';
import 'package:news_detective/models/user.dart';
import 'package:news_detective/screens/authenticate/login.dart';
import 'package:news_detective/screens/home/home.dart';
import 'package:news_detective/services/authService.dart';
import 'package:news_detective/services/userService.dart';
import 'package:news_detective/themes/input.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  UserService _userService = new UserService();

  bool loading = false;

  String name = '';
  String email = '';
  String password = '';
  String error = '';
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

  User getUserData(uId) {
    return new User(
        name: name,
        userId: uId,
        email: email,
        gender: gender,
        rangeAge: rangeAge,
        createdOn: DateTime.now(),
        notification: NotificationModel().initState());
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color(0xffA755BC),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed('/'),
              ),
              title: Text(
                "ٌRegistration",
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 100.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => 
                  Navigator.of(context).pushReplacementNamed('/')
              ),
              SizedBox(height: 30.0,),
              Text(
                'Sign up',
                style: TextStyle(fontSize: 50.0 , /*fontFamily: "Comfortaa"*/),
              ),*/
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            initialValue: name,
                            onChanged: (String value) {
                              setState(() {
                                name = value;
                              });
                            },
                            decoration: textInputDecoration.copyWith(
                              hintText: 'Name',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'Enter your name' : null,
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          TextFormField(
                            initialValue: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: textInputDecoration.copyWith(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            validator: (val) {
                              if (val.isEmpty || !val.contains('@')) {
                                return 'Enter valid email';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          TextFormField(
                            autofocus: false,
                            enableSuggestions: false,
                            autocorrect: false,
                            obscureText: true,
                            initialValue: '',
                            keyboardType: TextInputType.visiblePassword,
                            decoration: textInputDecoration.copyWith(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            validator: (val) => val.length < 6
                                ? 'Enter password 6+ chars long'
                                : null,
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          DropdownButtonFormField<String>(
                            decoration: textInputDecoration.copyWith(
                              hintText: 'Select Age Range',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            value: rangeAge,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 20,
                            elevation: 16,
                            validator: (val) =>
                                val == null ? 'Select your age range' : null,
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
                            height: 7.0,
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
                            validator: (val) =>
                                val == null ? 'Select your gender' : null,
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
                          SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black /*Color(0xffA755BC)*/,
                                //padding: const EdgeInsets.all(10.0),
                                minimumSize: Size.fromHeight(70.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  //side: BorderSide(color: Color(0xffA755BC)),
                                ),
                              ),
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  _auth
                                      .signUpWithEmailAndPassword(
                                          email, password)
                                      .then((result) async => {
                                            if (result != null)
                                              {
                                                _userService
                                                    .add(
                                                        getUserData(result.uid))
                                                    .then((uResult) => {
                                                          if (uResult != null)
                                                            {
                                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()))
                                                              //Navigator.of(context).pushReplacementNamed('/home')
                                                            }
                                                        }),
                                              }
                                            else
                                              {
                                                setState(() {
                                                  error =
                                                      'this email is already used';
                                                  loading = false;
                                                })
                                              }
                                          });
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style: TextStyle(
                                color: Color(0xFFB00020), fontSize: 14.0),
                          ),
                          SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Have an account ? ",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  )),
                              InkWell(
                                  child: new Text(
                                    "LOG IN",
                                    style: TextStyle(
                                      fontSize: 23.0,
                                      decoration: TextDecoration.underline,
                                      color: Color(0xffA755BC),
                                    ),
                                  ),
                                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogIn()))
                                  //onTap: () => Navigator.of(context).pushReplacementNamed("/login")
                                ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ]),
            )));
  }
}
