import 'package:lkhdma_lik/API/Constant.dart';
import 'package:lkhdma_lik/Models/Company_Fav.dart';
import 'dart:convert';

import 'package:http/http.dart'as http;

class Company_Favorite_API{



  Future<List<Company_Fav_Model>?> getFavCandidateList(int idCompany) async {
     try{
         var reponse = await http.post(Uri.parse(FAVORITE_ENDPOINT), body:{
          "action" : "GET_ALL" ,
          "idCandidat": idCompany.toString(),


         });

         var body = json.decode(reponse.body);
          List<Company_Fav_Model> list_fav = [];
          for (var item in body) {
            print(item);
            // var listi = item['data'] as Map<String, dynamic>;
            list_fav.add(Company_Fav_Model.fromJson(item));
            return list_fav;
          }

      
       
         if(body == "Error"){
           print("il y une erreur");
           



         }else{
          

         }

     }catch(e){
       
    
          
      print("Error in http request " + e.toString());


      
     }


  
  }

  

  Future addCandidate_to_Fav(int idCandidate, DateTime date, int idCompany) async{
       try{
      var reponse = await http.post(Uri.parse(FAVORITE_ENDPOINT), body: {
      "action" : "INSERT_FAVORITE",
      "Date" : date.toString(),
      "idCandidate" : idCandidate.toString(),
      "idCompany" : idCompany.toString(),

    });
    var data = json.decode(reponse.body);

      if(data == "Success"){
      



      }else{
       


      }
    

    }catch(e){
      print("Il y a une erreur $e");
      

    }
   
  }

  Future delete_Candidate_Fav(int idFav) async {

    try{
       var reponse = await http.post(Uri.parse(FAVORITE_ENDPOINT),body:{
         "action": "DELETE", 
         "idFav": idFav,



       });
       var result = json.decode(reponse.body);
       if(result == "Success"){
       


       }
     

     }catch(e){
       print("Il y a une erreur de la suppression $e");


     }
  }




}