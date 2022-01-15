import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Pin with ChangeNotifier, DiagnosticableTreeMixin {

  late SharedPreferences _prefs;
  String _oldOtp ="";
  String _otp = "";
  var _otpSymbols = ['\u{25CB}', '\u{25CB}', '\u{25CB}', '\u{25CB}'];

  String get otp => _otp;
  String get oldOtp => _oldOtp;

  set setPin(String value) {
    _otp = value;
    notifyListeners();
  }

  void CleanOtp() {
    _otp = '';
  }

  Future<bool> CheckOtp() async {
    return _oldOtp == _otp;
  }

  void authentication() async{
    _prefs = await SharedPreferences.getInstance();
  }

  void getPinFromStorage() async{
    _oldOtp = _prefs.getString('otp')!;
  }

  void setPinToStorage() async {
    _oldOtp = _otp;
    await _prefs.setString('otp', _otp);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('otp', _otp));
  }
}