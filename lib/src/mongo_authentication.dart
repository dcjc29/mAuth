//implemented just to check the functionality of the mongo_user model class.

import 'package:mAuth/mAuth.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../mAuth.dart';
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

  hashPassword(String password) {
    var key = utf8.encode(password);
    var bytes = utf8.encode("**SceretByteCode**");

    var hmacSha256 = new Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);

    return digest.toString();
  }
}
