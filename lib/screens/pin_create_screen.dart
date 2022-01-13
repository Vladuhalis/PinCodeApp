import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_ex/components/digit_keyboard.dart';
import 'package:flutter_test_ex/components/pin_ui.dart';
import 'package:flutter_test_ex/core/pin.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/src/provider.dart';

class PinCodeCreateUI extends StatelessWidget {
  PinCodeCreateUI({Key? key}) : super(key: key);

  String _otp = "";
  var _otpSymbols = ['\u{25CB}', '\u{25CB}', '\u{25CB}', '\u{25CB}'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Use 4-digits PIN',
                  style: TextStyle(
                      color: HexColor('#92A2BC'),
                      fontFamily: 'Roboto',
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: Text(
                'Setup PIN',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Label
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(
                    'Create PIN',
                    style: TextStyle(
                        color: HexColor('#92A2BC'),
                        fontFamily: 'Roboto',
                        fontSize: 28,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        context.watch<PinUi>().getOtpSymbolsByIndex(0),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        context.watch<PinUi>().getOtpSymbolsByIndex(1),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w200),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        context.watch<PinUi>().getOtpSymbolsByIndex(2),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w200),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        context.watch<PinUi>().getOtpSymbolsByIndex(3),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w200),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          //Digit keys
          Expanded(
            flex: 3,
            child: DigitKeyboard(),
          ),
        ],
      ),
    );
  }
}
