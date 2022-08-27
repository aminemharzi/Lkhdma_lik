import 'package:cloud_firestore/cloud_firestore.dart';

class Company_Fav_Model{

  int idFav;
  DateTime date;
  int idCandidate;
  int idCompany;


  Company_Fav_Model(this.idFav, this.date, this.idCandidate, this.idCompany);

  Company_Fav_Model.fromJson(Map<String ,dynamic> json):
  idFav= int.parse(json["idFav"]) , 
  date = (json["date"] as Timestamp).toDate(),
  idCandidate = int.parse(json["idCandidat"]),
  idCompany =  int.parse(json["idE"]);



}