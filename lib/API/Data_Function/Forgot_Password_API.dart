import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lkhdma_lik/API/Constant.dart';

class Forgot_Password_API {

  
  Future verify_email(String email, String account_type) async{


    try{
      var request =await http.post(Uri.parse(FORGOT_PASSWORD),
        body: {
          "action": "VERIFY_EMAIL",
          "account": account_type, 
          "email": email
        }
      );
      var reponse = json.decode(request.body);

      if(reponse.toString()== "VALID EMAIL"){
        print("VALID EMAIL");
        return 1;

      }else{
         print("NOT EMAIL");
        return 0;
      }


    }catch(e){
      print("there is an error : $e");
      return 0;
    }



  }

  Future update_password(String password, String email,String account_type) async{
     try{
      var request =await http.post(Uri.parse(FORGOT_PASSWORD),
        body: {
          "action": "UPDATE_PASSWORD",
          "account": account_type, 
          "password": password, 
          "email": email,
        }
      );
      var reponse = json.decode(request.body);
  

      if(reponse.toString()== "PASSWORD IS UPDATED"){
        print("PASSWORD IS UPDATED");
        return 1;

      }else{
         print("ERROR IN UPDATING");
        return 0;
      }


    }catch(e){
      print("there is an error : $e");
      return 0;
    }


  }





}