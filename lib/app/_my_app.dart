import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ui/pages/_app_ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.dark(
          background: Colors.grey.shade200,
          primary: CupertinoColors.activeBlue,
          secondary: CupertinoColors.black
        )
      ),
      home: const AppUi(),
    );
  }
}
