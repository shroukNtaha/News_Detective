import 'package:News_Detective/models/userModel.dart';
import 'package:News_Detective/services/auth.dart';
import 'package:News_Detective/services/userService.dart';
import 'package:News_Detective/themes/input.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  UserService _userService = new UserService();

  String name = '';
  String email = '';
  String password = '';
  String error = '';

  UserModel getUserData(uId) {
    return new UserModel(
        name: name, userId: uId, email: email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B475D),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Center(
                child: Text('Scholar Chat',
                  style: TextStyle(color: Colors.white, fontSize: 30,
                    fontWeight: FontWeight.bold,fontStyle: FontStyle.italic
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                initialValue: name,
                onChanged: (String value) {
                  setState(() {name = value;});
                },
                decoration: textInputDecoration.copyWith(hintText: 'Name',
                  hintStyle: TextStyle(color: Colors.white),),
                validator: (val) =>
                    val.isEmpty ? 'Enter your Name' : null,
              ),
              SizedBox(height: 7.0,),
              TextFormField(
                initialValue: email,
                decoration: textInputDecoration.copyWith(hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.white),),
                validator: (val) {
                  if (val.isEmpty || !val.contains('@')) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {email = value;});
                },
              ),
              SizedBox(height: 7.0,),
              TextFormField(
                autofocus: false,
                enableSuggestions: false,
                autocorrect: false,
                obscureText: true,
                initialValue: '',
                keyboardType: TextInputType.text,
                decoration: textInputDecoration.copyWith(hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.white),),    
                validator: (val) => val.length < 6
                  ? 'Enter password 6+ chars long'
                  : null,
                onChanged: (value) {
                  setState(() {password = value;});
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Expanded(
                    child: RaisedButton(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.white)),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Color(0xFF2B475D), fontSize: 20),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _auth.signUpWithEmailAndPassword(email, password)
                          .then((result) async => {
                            if (result != null){
                              await _userService.add(getUserData(result.uid))
                                .then((uResult) => {
                                  if (uResult != null){
                                    Navigator.of(context).pushReplacementNamed('/home')
                                  }
                                }),
                            }
                            else{
                              setState(() {
                                error = 'please enter a valid email';
                              })
                            }
                          });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.amber, fontSize: 14.0),
              ),
            ]
          )
        )
      )
    );
  }
}
