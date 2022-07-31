import 'package:flutter/material.dart';
import 'package:lkhdma_lik/Entreprise/Account/Home.dart';
import 'package:get/get.dart';
import 'package:lkhdma_lik/Themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  RxBool _isLightTheme = false.obs;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  _getThemeStatus() async {
    var _isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
    }).obs;
    _isLightTheme.value = (await _isLight.value)!;
    Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  MyApp() {
    _getThemeStatus();
  }

  ThemeData _darkTheme = ThemeData(
      accentColor: Colors.red,
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      ));

  ThemeData _lightTheme = ThemeData(
      accentColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        disabledColor: Colors.grey,
      ));

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
