import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SpinKitRotatingCircle(
        color: Color(0xffA755BC),
        size: 50.0,
      ),
    );
  }
}