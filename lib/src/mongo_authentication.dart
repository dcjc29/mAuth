import 'dart:math';
import 'package:mAuth/mAuth.dart';
import 'package:mAuth/src/services.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'mongo_user.dart';

class MongoAuth {
  static Db db = MongoDB.instance;
  var collection = db.collection("dartCollection");
  Services services = new Services();

  addCollection(MongoUser user) async {
    final MongoUser usermodel = new MongoUser(
        email: user.email, password: user.password, name: user.name);
    final Map<String, dynamic> data = usermodel.toMap();
    await collection.insert(data);
  }

  Future<String> forgotPassword(String email) async {
    try {
      Map<String, dynamic> doc = await collection.findOne({"email": email});
      if (doc == null) {
        return "NO_USER";
      } else {
        doc["tempCode"] = services.tempCodeGenerator();
        await collection.save(doc);
        return "USER_FOUND";
        // ignore: todo
        //TODO: send email.
      }
    } on MongoDartError catch (e) {
      print(e.message);
      return e.message;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }


  hashPassword(String password) {
    var key = utf8.encode(password);
    var bytes = utf8.encode("**SceretByteCode**");

    var hmacSha256 = new Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);

    return digest.toString();
  }
}
