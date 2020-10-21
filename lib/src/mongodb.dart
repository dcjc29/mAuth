import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

class MongoDB {
  final String url;

  MongoDB({this.url});

  static Db instance;
  static MongoDB _mongoDB;

  Future<String> createConnection({MongoDB dbObject}) async {
    String status = "";
    await getInstance(dbObject: dbObject).then((db) => {
          if (db.isConnected)
            {
              status = "Success",
            }
          else
            {status = "Failed"}
        });
    return status;
  }

  static Future<MongoDB> getMongoDBObject({MongoDB dbObject}) async {
    if (_mongoDB == null) {
      _mongoDB = dbObject;
      return _mongoDB;
    }
    return _mongoDB;
  }

  static Future<Db> getInstance({MongoDB dbObject}) async {
    if (instance == null) {
      _mongoDB = dbObject;
      instance = await Db.create(dbObject.url);
      await instance.open();
      return instance;
    }
    return instance;
  }
}
