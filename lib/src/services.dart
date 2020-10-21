import 'dart:math';

class Services {
  static const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
  Random _rnd = Random();

  String tempCodeGenerator() {
    return String.fromCharCodes(Iterable.generate(
        6, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  Future<dynamic> sendTempCode() async{
    // https://pub.dev/packages/mailer 
  }


}
