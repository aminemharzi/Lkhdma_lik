import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:lkhdma_lik/API/Constant.dart';
import 'package:lkhdma_lik/Models/Company_Register_Model.dart';
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
  Future<Company_Resgister_Model?> register(String userName , String email,String password) async {
     try{
                  var reponse = await http.post(Uri.parse(ACCOUNT_ENDPOINT), body:{
                  "action" : "INSERT",
                  "part" : "COMPANY",
                  "email" : email,
                  "password": password, 

              });
              if(reponse.statusCode==200){
                var data =json.decode(reponse.body);
                  
                  var register = Company_Resgister_Model.fromJson(data);

              }else{
                return null;
              }
               
             

          }on SocketException catch(e){
            print("No connection");
            return null;
          

          }catch(e){
            print("There is an exception : $e");
            return null;

          }

  }

    Future save_google_account(String email) async {
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

  //Store the user data in Mysql
  Future save_facebook_account(String email) async {
    try{
              var reponse = await http.post(Uri.parse(ACCOUNT_ENDPOINT), body:{
              "action" : "INSERT" ,
              "part" : "COMPANY",
              "email" : email,
              "password": "CONNECTION WITH FACEBOOK", 

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