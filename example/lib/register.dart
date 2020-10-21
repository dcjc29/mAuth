import 'package:flutter/material.dart';
import 'package:mAuth/mAuth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var instance;
  MongoAuth mongoAuth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auth Register"),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(child: Text("Trigger Register Func"), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
