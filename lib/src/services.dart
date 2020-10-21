import 'dart:math';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';

class Services {
  static const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
  Random _rnd = Random();

  String tempCodeGenerator() {
    return String.fromCharCodes(Iterable.generate(
        6, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  String hashPassword(String password) {
    var key = utf8.encode(password);
    var bytes = utf8.encode("**SceretByteCode**");

    var hmacSha256 = new Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
    return digest.toString();
  }

  String uidGenarate() {
    var uuid = Uuid();
    String uid = uuid.v4();
    return uid;
  }

  Future<dynamic> sendTempCode() async {
    // https://pub.dev/packages/mailer
  }
}
