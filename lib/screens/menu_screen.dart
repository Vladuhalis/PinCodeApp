import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_ex/screens/pin_authentication_screen.dart';
import 'package:flutter_test_ex/screens/pin_create_screen.dart';
import 'package:flutter_test_ex/core/pin.dart';
import 'package:provider/src/provider.dart';


class Menu extends StatelessWidget {
  const Menu({Key? key,}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    context.read<Pin>().authentication();
    return Scaffold(
        body: Center(
          child: Wrap(
            direction: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  child: const Text("Create Pin Code"),
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PinCodeCreateUI()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PinCodeAuthenticationUI()),
                    );
                  },
                  child: const Text("Enter with Pin Code"),
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("Pin Code App"),
          centerTitle: true,
        ),
      );
  }
}
