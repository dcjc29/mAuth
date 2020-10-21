//implemented just to check the functionality of the mongo_user model class.

import 'package:mAuth/mAuth.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'mongo_user.dart';

class MongoAuth {
  static Db db = MongoDB.instance;
  var collection = db.collection("dartCollection");

  addCollection(MongoUser user) async {
    final MongoUser usermodel = new MongoUser(
        email: user.email, password: user.password, name: user.name);
    final Map<String, dynamic> data = usermodel.toMap();
    await collection.insert(data);
  }

  Future<MongoUser> forgotPassword(String email) async {
    await collection.findOne({"email": email}).then((value) {
      print(value);
      MongoUser user = MongoUser.fromMap(value);
      print(user.name);
      return user;
    });
  }
}
