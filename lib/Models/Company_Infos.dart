class Company_Infos{
  String id;
  String description;
  String size;
  String city;
  String name;
  String activity;
  String location;
  String transaction_number;
  String idUser;


  Company_Infos(this.id, this.description, this.city,this.location, this.name, this.activity, this.transaction_number, this.size, this.idUser);

  Company_Infos.fromJson(Map<String, dynamic> json):
  id= json["idE"],
  name= json["nom"],
  description= json["description"],
  size= json["taille"],
  city= json["ville"],
  transaction_number= json["CA"],
  activity= json["secteur"],
  location= json["location"],
  idUser= json["idUser_Entre"];

  Map<String, dynamic> toJson(){
     final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idE'] = this.id;
    data['nom'] = this.name;
    data['description'] = this.description;
    data['taille'] = this.size;
    data['ville'] = this.city;
    data['CA'] = this.transaction_number;
    data['secteur'] = this.activity;
    data['location'] = this.location;
    data['idUser_Entre'] = this.idUser;
    
   
    return data;
  }


}