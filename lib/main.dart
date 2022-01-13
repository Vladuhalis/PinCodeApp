import 'package:flutter/material.dart';
import 'package:flutter_test_ex/screens/pin_create_screen.dart';
import 'package:provider/provider.dart';
import 'components/pin_ui.dart';
import 'core/pin.dart';
import 'screens/menu_screen.dart';

void main() => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Pin()),
          ChangeNotifierProvider(create: (_) => PinUi()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Menu(),
        )));
