import 'package:flutter/material.dart';
import 'package:flutter_test_ex/components/pin_ui.dart';
import 'package:flutter_test_ex/core/pin.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/src/provider.dart';

class DigitButton extends StatelessWidget {
  String index;

  DigitButton(this.index,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(120),
      child: SizedBox(
        width: 80,
        height: 80,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: HexColor('#f4f6f8'),
          ),
          child: Text(
            index,
            style: TextStyle(
                fontSize: 30,
                color: HexColor('#9aa9c1')
            ),
          ),
          onPressed: () {
            if (context.read<Pin>().otp.length < 4){
              context.read<Pin>().setPin=context.read<Pin>().otp+ index;
              for (int i=0; i < context.read<Pin>().otp.length; i++) {
                context.read<PinUi>().setValueByIndex("\u{25CF}", i);
              }
            }
          },
        ),
      ),
    );
  }
}

