import 'package:flutter/material.dart';
import 'package:flutter_test_ex/components/pin_ui.dart';
import 'package:flutter_test_ex/core/pin.dart';
import 'package:flutter_test_ex/screens/menu_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/src/provider.dart';

class DigitButton extends StatefulWidget {
  String index;
  bool check;

  DigitButton(this.index, this.check, {Key? key}) : super(key: key);

  @override
  State<DigitButton> createState() => _DigitButtonState();
}

class _DigitButtonState extends State<DigitButton> {
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
            widget.index,
            style: TextStyle(fontSize: 30, color: HexColor('#9aa9c1')),
          ),
          onPressed: () {
            if (context.read<Pin>().otp.length < 4) {
              context.read<Pin>().setPin =
                  context.read<Pin>().otp + widget.index;
              for (int i = 0; i < context.read<Pin>().otp.length; i++) {
                context.read<PinUi>().setValueByIndex("\u{25CF}", i);
              }
              if (context.read<Pin>().otp.length == 4) {
                if (widget.check == true) {
                  context.read<Pin>().setPinToStorage();
                  context.read<Pin>().CleanOtp();
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Внимание!'),
                            content: const Text('Сохранение выполнено!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ));
                } else {

                  if (context.read<Pin>().oldOtp == context.read<Pin>().otp) {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('Внимание!'),
                              content: const Text('Вход выполнен!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ));
                  } else {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('Внимание!'),
                              content: const Text('Вход не выполнен!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(
                                    context,
                                    'OK',
                                  ),
                                  child: const Text('OK'),
                                ),
                              ],
                            )
                    );
                  }
                  context.read<Pin>().CleanOtp();
                }
                for (int i = 0; i < 4; i++) {
                  context.read<PinUi>().setValueByIndex('\u{25CB}', i);
                }
              }
            }
          },
        ),
      ),
    );
  }
}
