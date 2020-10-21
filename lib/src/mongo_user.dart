class MongoUser {
  String email;
  String password;
  String name;
  String username;
  String uid;
  String claims;
  String tempCode;

  MongoUser({this.email, this.password, this.name, this.username, this.uid,
      this.claims, this.tempCode})
      : assert(email != null, "Email is null"),
        assert(password != null, "Password is null"),
        assert(name != null, "Name is null");

  MongoUser.map(dynamic user) {
    this.email = user['email'];
    this.password = user['password'];
    this.name = user['name'];
    this.username = user['username'];
    this.uid = user['uid'];
    this.claims = user['claims'];
    this.tempCode = user['tempCode'];
  }

  // String get email => email;
  // String get password => password;
  // String get name => name;
  // String get username => username;
  // String get uid => uid;
  // String get claims => claims;
  // String get tempCode => tempCode;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (uid != null) {
      map['uid'] = uid;
    }
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['username'] = username;
    map['claims'] = claims;
    map['tempCode'] = tempCode;

    return map;
  }

  MongoUser.fromMap(Map<String, dynamic> map) {
    if (map["uid"] != null) {
      this.uid = map['uid'];
    }
    this.email = map['email'];
    this.password = map['password'];
    this.name = map['name'];
    this.username = map['username'];
    this.claims = map['claims'];
    this.tempCode = map['tempCode'];
  }
}
