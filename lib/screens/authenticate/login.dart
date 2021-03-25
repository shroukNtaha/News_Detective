import 'package:news_detective/services/auth.dart';
import 'package:news_detective/themes/input.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 100.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey),),
                  validator: (val) =>
                      val.isEmpty ? 'Enter an valid email ' : null,
                  onChanged: (val) {
                    if (val.endsWith(' '))
                      setState(() => email = val.trim());
                    else
                      setState(() => email = val);
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
                  keyboardType: TextInputType.text,
                  decoration: textInputDecoration.copyWith(hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey),),
                  validator: (val) => val.length < 6
                    ? 'Enter n password 6+ chars long'
                    : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xff6200EE) ,
                    padding: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(color: Color(0xff6200EE))
                    ), 
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth
                          .signInWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Invalid email or password';
                        });
                      } else {
                        Navigator.of(context).pushReplacementNamed("/home");
                      }
                    }
                  },
                ), 
                SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't have an account",
                      style: TextStyle(
                        color: Color(0xff3700B3),
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 5.0),
                    InkWell(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Georgia',
                            color: Color(0xff16071e),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Color(0xFFB00020), fontSize: 14.0),
                ),
              ]
            )
          )
        ),
      )
    );
  }
}