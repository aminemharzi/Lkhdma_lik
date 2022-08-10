import 'dart:convert';

import 'package:lkhdma_lik/Models/Company_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  static saveAccountToLocal(Company_Model account) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var rs = await pref.setString("login",jsonEncode(account) );
  }

  static deleteAccountFromLocal() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var rs = await pref.remove('login');
  }
  static Future<Company_Model?> getAccountFromLocal() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var account = pref.getString('login');
    if(account== null){
      return null;
    }else {
      return Company_Model.fromJson(jsonDecode(account));
    }
  }
}