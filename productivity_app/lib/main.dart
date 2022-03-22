// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:productivity_app/UI/Intray/Intray_Page.dart';
import 'package:productivity_app/models/global.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Todo app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.yellow,
      home: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Stack(
              children: <Widget>[
                TabBarView(
                  children: [
                    IntrayPage(),
                    Container(
                      color: darkGreyColor,
                    ),
                    Container(
                      color: Colors.orange,
                    ),
                    Container(
                      color: Colors.lightGreen,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 50),
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Intray",
                        style: intrayTitleStyle,
                      ),
                      Container()
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.only(
                      top: 120,
                      left: MediaQuery.of(context).size.width * 0.5 - 40),
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.add,
                      size: 70,
                    ),
                    backgroundColor: blueColor,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            appBar: AppBar(
              elevation: 0,
              title: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.home),
                  ),
                  Tab(
                    icon: Icon(Icons.rss_feed),
                  ),
                  Tab(
                    icon: Icon(Icons.perm_identity),
                  ),
                ],
                labelColor: darkGreyColor,
                unselectedLabelColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.all(5.0),
                indicatorColor: Colors.transparent,
              ),
              backgroundColor: Colors.white,
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
