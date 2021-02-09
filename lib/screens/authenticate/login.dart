import 'package:News_Detective/services/auth.dart';
import 'package:News_Detective/themes/input.dart';
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
      backgroundColor: Color(0xFF2B475D),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Image(
                    image: AssetImage("img/logo.png"),
                    width: 200.0,
                    height: 150.0,
                  ),
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
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 22,),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white),),
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
                  hintStyle: TextStyle(color: Colors.white),),
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
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.white)),
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Color(0xFF2B475D), fontSize: 20),
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
                ),   
                SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't have an account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 5.0),
                    InkWell(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
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
                  style: TextStyle(color: Colors.amber, fontSize: 14.0),
                ),
              ]
            )
          )
        ),
      )
    );
  }
}