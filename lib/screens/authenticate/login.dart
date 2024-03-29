import 'package:loading/loading.dart';
import 'package:news_detective/screens/authenticate/signup.dart';
import 'package:news_detective/screens/home/home.dart';
import 'package:news_detective/services/authService.dart';
import 'package:news_detective/themes/input.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar:
                /* PreferredSize(
        preferredSize: Size.fromHeight(100.0),
          child: */
                AppBar(
              backgroundColor: Color(0xffA755BC),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24.0,
                ),
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed('/'),
              ),
              title: Text(
                "Log in",
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
              centerTitle: true,
            ),
            //),
            body: SingleChildScrollView(
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 100.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => 
                  Navigator.of(context).pushReplacementNamed('/')
              ),
              SizedBox(height: 50.0,),
              Text(
                'Log in',
                style: TextStyle(fontSize: 50.0 ,/* fontFamily: "Comfortaa"*/),
              ),*/
                      Center(
                        child: Form(
                            key: _formKey,
                            child: Column(children: <Widget>[
                              SizedBox(
                                height: 70.0,
                              ),
                              TextFormField(
                                decoration: textInputDecoration.copyWith(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) => val.isEmpty
                                    ? 'Enter an valid email '
                                    : null,
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
                                keyboardType: TextInputType.visiblePassword,
                                decoration: textInputDecoration.copyWith(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                validator: (val) => val.length < 6
                                    ? 'Enter password 6+ chars long'
                                    : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
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
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      //side: BorderSide(color: Color(0xffA755BC)),
                                    ),
                                  ),
                                  child: Text(
                                    'LOG IN',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      dynamic result = await _auth
                                          .signInWithEmailAndPassword(
                                              email, password);
                                      if (result == null) {
                                        setState(() {
                                          error = 'Invalid email or password';
                                          loading = false;
                                        });
                                      } else {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                                        //Navigator.of(context).pushReplacementNamed("/home");
                                      }
                                    }
                                  },
                                ),
                              ),
                              /*SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "don't have an account ?",
                            style: TextStyle(
                              color: Color(0xffA755BC),
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          InkWell(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontFamily: 'Georgia',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed('/signup');
                            },
                          ),
                        ],
                      ),*/
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
                                  Text("Don't have an account ? ",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      )),
                                  InkWell(
                                      child: new Text(
                                        "SIGN UP",
                                        style: TextStyle(
                                          fontSize: 23.0,
                                          decoration: TextDecoration.underline,
                                          color: Color(0xffA755BC),
                                        ),
                                      ),
                                      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()))
                                      //Navigator.of(context).pushReplacementNamed("/signup")
                                  ),
                                ],
                              ),
                            ])),
                      ),
                    ],
                  )),
            ));
  }
}
