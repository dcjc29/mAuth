import 'package:mAuth/mAuth.dart';
import 'package:mAuth/src/services.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'mongo_user.dart';

class MongoAuth {
  static Db db = MongoDB.instance;
  var collection = db.collection("dartCollection");
  Services services = new Services();

  addCollection(MongoUser user) async {
    final MongoUser usermodel = new MongoUser(
        email: user.email,
        password: user.password,
        name: user.name,
        username: user.username,
        uid: user.uid);
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
        await services.sendTempCode(email, doc["tempCode"]);
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

  Future<String> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      Map<String, dynamic> doc = await collection.findOne({"email": email});
      if (doc != null) {
        return "email-already-in-use";
      } else {
        var hashpass = services.hashPassword(password);
        var userId = services.uidGenarate();
        MongoUser user = new MongoUser(
          email: email,
          name: name,
          password: hashpass,
          uid: userId,
        );
        await addCollection(user);

        return "User_Created";
      }
    } on MongoDartError catch (e) {
      print(e.message);
      return e.message;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
}
