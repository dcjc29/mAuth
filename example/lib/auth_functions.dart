import 'package:flutter/material.dart';
import 'package:mAuth/mAuth.dart';

class AuthFunctions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AuthFunctionsState();
  }
}

class AuthFunctionsState extends State<AuthFunctions> {
  MongoAuth mongoAuth;

  @override
  void initState() {
    super.initState();
    mongoAuth = new MongoAuth();
    MongoUser user = new MongoUser(email: "pamuditha@gmail.com", password: "123", name: "Maduranga", username: "pamu47",uid: "cvdvddds");
    mongoAuth.addCollection(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auth functions"),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
                child: Text("Fogot Password"),
                onPressed: () {
                  forgotpassword();
                  // Future<MongoUser> emailvalidation =
                  //     mongoAuth.forgotPassword("pamu@gmail");
                }),
          ],
        ),
      ),
    );
  }

  forgotpassword() async {
    await mongoAuth.forgotPassword("pamudithamaduranga@gmail.com").then((value) {
      String user = value;
      print(user);
    });
  }
}
