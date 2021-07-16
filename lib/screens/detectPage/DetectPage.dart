import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:news_detective/common/loading.dart';
import 'package:news_detective/services/newsService.dart';
import 'package:news_detective/widget/appBar.dart';
//import 'package:mysql1/mysql1.dart';
import 'package:news_detective/widget/drawer.dart';


class DetectPage extends StatefulWidget {

  @override
  _DetectState createState() => _DetectState();
}

class _DetectState extends State<DetectPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String article = "";
  String finalResponse="";
  final articleCont = new TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ListView(
              // children: [
              Expanded(
                child: Form(
                  key: _formKey,
                  //color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      minLines: 100,
                      controller: articleCont,
                      cursorColor: Color(0xffA755BC),
                      //  minLines: 30,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration.collapsed(
                        border: OutlineInputBorder(),
                          hintText: "Enter the news you want to detect here"),
                      validator: (value) {
                        if (value.isEmpty || value.contains(new RegExp(r'[0-9]'))) {
                          return 'Enter the valid article';
                        }
                        else{
                          return null;
                        }

                      },

                    ),
                  ),
                ),
              ),
              //],
              //),
              SizedBox(height: 50.0),
              Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    //side: BorderSide(color: Color(0xffA755BC)),
                  ),
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 110.0),

                  onPressed: () async
                  {
                      if(_formKey.currentState.validate())
                        {
                          print("validated");
                          article = articleCont.text;

                          setState(() {
                            article = articleCont.text;
                          });
                          final url =Uri.parse("http://10.0.2.2:5000/article");
                          final response = await http.post(url, body: json.encode({'article' : article}));
                          final decoded = json.decode(response.body) as Map<String, dynamic>;

                          //changing the UI be reassigning the fetched data to final response
                          setState(() {
                            finalResponse = decoded['article'];
                          });
                        }
                      else
                        {
                          print("Not Validated");
                        }

                  },
                  color: Color(0xffA755BC),
                  child: Text(
                    'Detect',
                    style: TextStyle(color: Colors.white, fontSize: 35.0),
                  ),
                ),
              ),

              Center(
                child: Container(
                  color: finalResponse=="REAL" ? Colors.green : finalResponse=="FAKE" ? Colors.red : Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 13.0),
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 110.0),
                  child: Text(finalResponse,style: TextStyle(fontSize: 30.0),),
                ),
              )
              //Text(final_response, style: TextStyle(fontSize: 24),),

              //SizedBox(height: 30.0),
            ],
          ),
        ));
  }
}
