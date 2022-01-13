import 'package:flutter/foundation.dart';

class PinUi with ChangeNotifier, DiagnosticableTreeMixin {
  List<String> _otpSymbols = ['\u{25CB}', '\u{25CB}', '\u{25CB}', '\u{25CB}'];
  int counter = 0;
  List<String> get otpSymbols => _otpSymbols;

  String getOtpSymbolsByIndex(int index) => _otpSymbols[index];

  set setPinUi(List<String> value) {
    _otpSymbols = value;
    notifyListeners();
  }

  void addDigitPin() {
    if (counter < 4) {
      _otpSymbols[counter] = '\u{25CF}';
      if (counter < 3) {
        counter++;
      }
    }
  }

  void delDigitPin() {
    if (counter != 0) {
      _otpSymbols[counter] = '\u{25CB}';
      counter--;
    }
  }

  void setValueByIndex(String value, int index) {
    _otpSymbols[index] = value;
    counter++;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('otpSymbols', _otpSymbols));
  }
}
