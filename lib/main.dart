import 'package:News_Detective/models/user.dart';
import 'package:News_Detective/screens/authenticate/login.dart';
import 'package:News_Detective/screens/authenticate/signup.dart';
import 'package:News_Detective/screens/home/home.dart';
import 'package:News_Detective/services/auth.dart';
import 'package:News_Detective/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


//void main() => runApp(MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
   
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserAuth>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/': (BuildContext context) => Wrapper(),
          '/login': (BuildContext context) => LogIn(),
          '/signup': (BuildContext context) => SignUp(),
          '/home': (BuildContext context) => Home(),
          /*'/profile': (BuildContext context) => Profile(),
          '/forgetPassword': (BuildContext context) => ForgetPassword(),
          '/search': (BuildContext context) => Search()*/
        },
      ),
    );
  }
}