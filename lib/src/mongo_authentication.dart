//implemented just to check the functionality of the mongo_user model class.

import 'package:mongo_dart/mongo_dart.dart';
import 'mongo_user.dart';

class MongoAuth{

  addCollection(Future<Db> instance,MongoUser user) async {
    Db db;
    await instance.then((value) => db = value);
    var collection = db.collection("dartCollection");
    final MongoUser usermodel = new MongoUser(email: user.email,password: user.password, name: user.name);
    final Map<String, dynamic> data = usermodel.toMap();
    await collection.insert(data);
  }

}
