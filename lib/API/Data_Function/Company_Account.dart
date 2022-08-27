import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:lkhdma_lik/API/Constant.dart';
import 'package:lkhdma_lik/Models/Company_Infos.dart';
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
                
                if(data.toString()== "EMAIL EXIST"){
                  return null;

                }else{

                       var register = Company_Resgister_Model.fromJson(data);
                       return register;

                }
                  
             
              }else{
                return null;
              }
               
             

          }on SocketException catch(e){
            print("No connection");
            return null;
          

          }catch(e){
            if(e.toString()== "type 'String' is not a subtype of type 'Map<String, dynamic>'"){
              print("Type Exception : $e");
              return null;
            }else{
               print("There is an exception : $e");
            return null;

            }
           

          }

  }


   Future<Company_Infos?> company_info(String name , String size,String description, String location,String city, 
   String activity, String transaction_number,int idCompany) async {
           try{
                  var reponse = await http.post(Uri.parse(COMPANY_ENDPOINT), body:{
                    "action" : "INSERT_COMPANY",
                    "nom" : name,
                    "secteur" : activity,
                    "CA" : transaction_number,
                    "ville" : city,
                    "taille" : size,   
                    "location": location,              
                    "description" : description,
                    "idUser": idCompany.toString(),


              });
              
            
                var data =json.decode(reponse.body);
                print("@@@@@@data is : ${data.toString()}");
                
                if(data.toString()== "Error"){
                  return null;

                }else{

                       var company_infos = Company_Infos.fromJson(data);
                       return company_infos;

                }
                  
             
             
               
             

          }on SocketException catch(e){
            print("No connection");
            return null;
          

          }
          // on FormatException catch(e){
          //   if(e.toString()=="Unexpected character (at character 1)"){
          //     print("error in PHP");
          //   }

          // }
          
          catch(e){
            if(e.toString()== "type 'String' is not a subtype of type 'Map<String, dynamic>'"){
              print("@@@@Type Exception : $e");
              return null;
              
            }else{
               print("There is an exception : $e");
            return null;

            }
           

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