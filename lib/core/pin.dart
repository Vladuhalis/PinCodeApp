import 'package:flutter/foundation.dart';

class Pin with ChangeNotifier, DiagnosticableTreeMixin {
  String _otp = "";
  var _otpSymbols = ['\u{25CB}', '\u{25CB}', '\u{25CB}', '\u{25CB}'];

  String get otp => _otp;

  set setPin(String value) {
    _otp = value;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('otp', _otp));
  }
}