import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mAuth/mAuth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'mAuth Demo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MongoDB _mongoDB;

  @override
  void initState() {
    super.initState();
    setState(() {
      //replace YOUR_URL with mongo db url
      _mongoDB = MongoDB(url: "YOUR_URL");
    });
    _mongoDB.createConnection(dbObject: _mongoDB).then((value) => log(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'DB Initialized',
            ),
          ],
        ),
      ),
    );
  }
}
