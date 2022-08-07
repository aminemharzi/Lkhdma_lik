import 'package:flutter/material.dart';
import 'package:lkhdma_lik/Auth/Auth_Service.dart';
import 'package:lkhdma_lik/Entreprise/Account/Home.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //   theme: _lightTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Auth_Service().hanleAuthState(),
    );
  }
}
