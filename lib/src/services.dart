import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:mailer/smtp_server.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:mailer/mailer.dart';

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

  //email means code eka yana mail eka
  //sendMailAddress means code eka yawana address eka - dev address
  //passwrd means yawana mail eke password neda bn?
  //code eka means ithin genrate karna code eka

  Future<dynamic> sendTempCode(
    String email,
    String password,
    String sendMailAddress,
    String code,
  ) async {
    String userName = sendMailAddress;
    String mailPassword = password;

    final smtpServer = gmail(userName, mailPassword);

    final message = Message()
      ..from = Address(userName)
      ..recipients.add(email)
      ..subject = 'Password Reset Code'
      // ignore: unnecessary_brace_in_string_interps
      ..text = 'This is your Password reset code ${code}';

    try {
      final sendReport = await send(message, smtpServer);
      return 'Message sent: ${sendReport.toString()} ';
    } on MailerException catch (e) {
      for (var p in e.problems) {
        return 'Message not sent - Problem is : ${p.code}: ${p.msg}';
      }
    }
  }
}
