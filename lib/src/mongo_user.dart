class MongoUser {
  String id;
  String email;
  String password;
  String name;
  String username;
  String uid;
  String claims;
  String tempCode;

  MongoUser(
      {this.email,
      this.password,
      this.name,
      this.username,
      this.uid,
      this.claims,})
      : assert(email != null, "Email is null"),
        assert(password != null, "Password is null"),
        assert(name != null, "Name is null");

  MongoUser.map(dynamic user) {
    this.id = user['_id'];
    this.email = user['email'];
    this.password = user['password'];
    this.name = user['name'];
    this.username = user['username'];
    this.uid = user['uid'];
    this.claims = user['claims'];
    this.tempCode = user['tempCode'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['_id'] = id;
    }
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['username'] = username;
    map['uid'] = uid;
    map['claims'] = claims;
    map['tempCode'] = tempCode;

    return map;
  }

  MongoUser.fromMap(Map<String, dynamic> map) {
    if (map["_id"] != null) {
      this.id = map['_id'];
    }
    this.email = map['email'];
    this.password = map['password'];
    this.name = map['name'];
    this.username = map['username'];
    this.claims = map['claims'];
    this.uid = map['uid'];
    this.tempCode = map['tempCode'];
  }
}
