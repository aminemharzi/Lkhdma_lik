import 'package:flutter/material.dart';
import 'package:lkhdma_lik/Entreprise/Account/Home.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //   theme: _lightTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
