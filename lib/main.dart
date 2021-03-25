import 'package:news_detective/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/authenticate/login.dart';
import 'screens/authenticate/signup.dart';
import 'screens/home/home.dart';
import 'services/auth.dart';
import 'wrapper.dart';
import 'package:responsive_framework/responsive_framework.dart';


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
        builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
        ),
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