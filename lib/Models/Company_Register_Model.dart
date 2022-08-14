class Company_Resgister_Model{
  String id;
  String email;
  String? userName;
  String password;

  Company_Resgister_Model(this.id, this.email, this.password, {this.userName});

  Company_Resgister_Model.fromJson(Map<String, dynamic> json):
  id= json["idUser_Entre"],
  userName= json["userName"],
  email= json["email"],
  password= json["password"];

  Map<String, dynamic> toJson(){
     final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUser_Entre'] = this.id;
    data['email'] = this.email;
      data['userName'] = this.userName;
    data['password'] = this.password;
   
    return data;
  }


}