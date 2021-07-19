import 'package:flutter/material.dart';
import 'package:news_detective/screens/detectPage/DetectPage.dart';
import 'package:news_detective/screens/home/home.dart';
import 'package:news_detective/themes/input.dart';

class Appbar extends StatefulWidget {
  const Appbar({Key key, this.keyDrawer, this.active}) : super(key: key);
  final active;
  final keyDrawer;
  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  List<CategoryButton> categories = [
    CategoryButton('Sports'),
    CategoryButton('Politics'),
    CategoryButton('Arts'),
    CategoryButton('Health'),
    CategoryButton('Others'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Color(0xffA755BC),
          height: 150,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 50.0,
                ),
                onPressed: () => widget.keyDrawer.currentState.openDrawer(),
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset('assets/detictive_news.jpeg'),
            ],
          ),
        ),
        Container(
          color: Color(0xffA755BC),
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 8,
                  child: TextField(
                    cursorColor: Colors.black,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                    onChanged: null,
                    decoration: decor,
                  ),
                ),
                Expanded(
                  child: Icon(
                    Icons.search,
                    size: 40.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          color: Color(0xffA755BC),
          height: 60,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: categories,
          ),
        ),
        Container(
          color: Color(0xffA755BC),
          height: 60,
          child: Row(
            children: [
              Expanded(
                // ignore: deprecated_member_use
                // ignore: deprecated_member_use
                child: FlatButton(
                  color: widget.active == 'Home' ? Colors.white : null,
                  height: 60,
                  onPressed: () {},
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 20,
                      color:
                          widget.active == 'Home' ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                // ignore: deprecated_member_use
                child: FlatButton(
                  color: widget.active == 'Detect' ? Colors.white : null,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetectPage()));
                  },
                  child: Text(
                    'Detect News',
                    style: TextStyle(
                      fontSize: 20,
                      color: widget.active == 'Detect'
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
