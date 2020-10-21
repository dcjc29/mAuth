import 'package:flutter/material.dart';
import 'package:mAuth/mAuth.dart';

class AuthFunctions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AuthFunctionsState();
  }
}

class AuthFunctionsState extends State<AuthFunctions> {
  var instance;
  MongoAuth mongoAuth;

  @override
  void initState() {
    super.initState();
    mongoAuth = new MongoAuth();
    instance = MongoDB.getInstance();
    print("Instance ${instance.toString()}");
    MongoUser user = new MongoUser(email: "pamu@gmail",password: "123",name: "pamu");
    mongoAuth.addCollection(instance, user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auth functions"),
      ),
    );
  }
}
