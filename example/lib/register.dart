import 'package:flutter/material.dart';
import 'package:mAuth/mAuth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  MongoAuth mongoAuth;
  @override
  void initState() {
    super.initState();
    mongoAuth = new MongoAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auth Register"),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
                child: Text("Trigger Register Func"),
                onPressed: () {
                  createUser();
                })
          ],
        ),
      ),
    );
  }

  createUser() async {
    await mongoAuth
        .createUserWithEmailAndPassword("pamu@gmail.com", "password")
        .then((value) {
      String d = value;
      print(d);
    });
  }
}
