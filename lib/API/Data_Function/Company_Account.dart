import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:lkhdma_lik/API/Constant.dart';
class Company_Account_API{

  Future<String?> login(String email, String password) async{

      try{
              var reponse = await http.post(Uri.parse(ACCOUNT_ENDPOINT), body:{
              "action" : "CONNECTION" ,
              "part" : "ENTREPRISE",
              "email" : email,
              "password": password, 

          });
               
              var data =json.decode(reponse.body);
              return data;
      }catch(e){
        return "EROR";
      }
      

  }


}