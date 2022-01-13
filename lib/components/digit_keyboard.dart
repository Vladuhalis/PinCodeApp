
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_ex/components/pin_ui.dart';
import 'package:flutter_test_ex/core/pin.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/src/provider.dart';

import 'digit_button.dart';

class DigitKeyboard extends StatelessWidget {
  DigitKeyboard({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                child: DigitButton('1'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                child: DigitButton('2'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 20),
                child: DigitButton('3'),
              ),
            ]
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                child: DigitButton('4'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                child: DigitButton('5'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 20),
                child: DigitButton('6'),
              ),
            ]
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                child: DigitButton('7'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                child: DigitButton('8'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 20),
                child: DigitButton('9'),
              ),
            ]
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                child: Container(
                  width: 42,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                child: DigitButton('0'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 20),
                child: IconButton(
                  splashRadius: 40,
                  iconSize: 30,
                  icon: const Icon(Icons.backspace_rounded),
                  color: HexColor('#232748'),
                  onPressed: () {
                    if (context.read<Pin>().otp.isNotEmpty) {
                      context.read<Pin>().setPin = context.read<Pin>().otp.substring(0,context.read<Pin>().otp.length - 1);
                      for (int i = context.read<Pin>().otp.length; i < 4; i++) {
                        context.read<PinUi>().setValueByIndex("\u{25CB}", i);
                      }
                    }
                  },
                ),
              ),
            ]
        ),
      ],
    );
  }
}
