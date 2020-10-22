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

  Future<dynamic> sendTempCode(
    email,
    code,
  ) async {
    String userName = "pamudithamaduranga2@gmail.com";
    String mailPassword = "hitman.040147";

    final smtpServer = gmail(userName, mailPassword);

    final message = Message()
      ..from = Address(userName)
      ..recipients.add(email)
      ..subject = 'Password Reset Code'
      ..html =
          "<p>Someone (hopefully you) has requested a password reset for your account on (platform name).Use this code in your application to reset your password,</p><h2>$code</h2><br/>Thank you for using our service.<br/><br/><small>Powered by mAuth</small>";

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
