import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:lkhdma_lik/API/Constant.dart';
class Company_Account_API{

  Future login(String email, String password) async{

      try{
              var reponse = await http.post(Uri.parse(ACCOUNT_ENDPOINT), body:{
              "action" : "CONNECTION" ,
              "part" : "COMPANY",
              "email" : email,
              "password": password, 

          });
         
               
              var data =json.decode(reponse.body);
              return data.toString();
      }catch(e){
        print(e);
       
        return "EROR";
      }
      

  }

  //Store the user data in Mysql
  Future google_to_mySql(String email) async {
    try{
              var reponse = await http.post(Uri.parse(ACCOUNT_ENDPOINT), body:{
              "action" : "INSERT" ,
              "part" : "COMPANY",
              "email" : email,
              "password": "CONNECTION WITH GOOGLE", 

          });
         
               
          var data =json.decode(reponse.body);
          String? mm = await data; 
          print(mm);
         // return data.toString();
      } on SocketException catch(e){

       print("No Connextion");
       
       // return "EROR";
      }catch(e){
        print(e);
      }
      
  }


}