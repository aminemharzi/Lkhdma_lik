import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lkhdma_lik/Auth/Auth_Service.dart';
import 'package:lkhdma_lik/Entreprise/Account/Forgot_Passw.dart';
import 'package:lkhdma_lik/Entreprise/Account/Register.dart';
import 'package:lkhdma_lik/Entreprise/Home/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../API/Data_Function/Company_Account.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Company_Account_API account = new Company_Account_API();

  Auth_Service auth_service = new Auth_Service();


  GlobalKey<FormState> _login_key= new GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
   
    super.initState();
  }

  var loading = false ;

  void loginWithFacebook() async {
    setState(() {
      loading = true;
    });

    try{
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      print(facebookLoginResult.status.toString());

      final facebookAuthCredential = FacebookAuthProvider.credential(facebookLoginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      await FirebaseFirestore.instance.collection('users').add({
        'email': userData['email'],
        'imageUrl': userData['picture']['data']['url'],
        'name': userData['name'],
      });
      print("@@@@@@ Login with faceboog is succefully added");

    }catch(e){

      print("Exception is $e");
    }finally{

      setState(() {
        loading =false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.only(left: 22,),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(
                                5.0) //                 <--- border radius here
                            ),
                        border: Border.all(color: Color(0xffE8ECF4))),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/Vector.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(padding: EdgeInsets.only(right: 20),
            child: 
             Center(
                child: Text("Welcome back! Glad to see you, Again!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1E232C)))),),
           
            SizedBox(
              height: 32,
            ),
            Form(
              key: _login_key,
              child:Column(
              children: [
                Padding(padding: EdgeInsets.only(right: 20),
                child: TextFormField(
                  controller: email,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff56545D),
                fontWeight: FontWeight.w600,
              ),
              onChanged: (value) {
                //_submit();
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color(0xFFF2F3F9),
                    width: 2.0,
                  ),
                ),
                fillColor: Color(0xFFF2F3F9), filled: true,
                focusColor: Color(0xFFF2F3F9),
                //add prefix icon

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color(0xFFF2F3F9), width: 1.0),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFF2F3F9), width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // fillColor: Colors.grey,

                hintText: "Enter your email",

                //make hint text
                hintStyle: TextStyle(
                  // color: Colors.grey,
                  fontSize: 16,
                  fontFamily: "Rubik Medium",
                  fontWeight: FontWeight.w400,
                ),
              ),
                 validator: (value) => EmailValidator.validate(value!) && !value.isEmpty? null : "Please enter a valid email",
            ),),
                  
            SizedBox(
              height: 15,
            ),
            Padding(padding: EdgeInsets.only(right: 20),
            child: TextFormField(
              controller: password,
              obscureText: true,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff56545D),
                fontWeight: FontWeight.w600,
              ),
              onChanged: (value) {
                //_submit();
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color(0xFFF2F3F9),
                    width: 2.0,
                  ),
                ),
                fillColor: Color(0xFFF2F3F9), filled: true,
                focusColor: Color(0xFFF2F3F9),
                //add prefix icon

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color(0xFFF2F3F9), width: 1.0),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFF2F3F9), width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // fillColor: Colors.grey,

                hintText: "Enter your password",

                //make hint text

                hintStyle: TextStyle(
                  // color: Colors.grey,
                  fontSize: 16,
                  fontFamily: "Rubik Medium",
                  fontWeight: FontWeight.w400,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "password can not be empty";
                } else {
                  return null;
                }
              },
            ),),
            

              ],
            )),
          
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => Forgot_Password_Home());
                    },
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.rubik(
                          color: Color(0xff6A707C),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: ElevatedButton(
                onPressed: ()  async{
               
                     var formdata =_login_key.currentState;
                                        if(formdata!.validate()){
                                          String reponse = await account.login(email.text, password.text);
                                           
                                          print(reponse.toString());
                                          if(reponse.toString()=="NOT EMAIL"){
                                            final snackBar = SnackBar(
                                                  content: Text("Email does not exist", style: TextStyle(color: Colors.white),),
                                                  backgroundColor: Colors.red,
                                                  );

                                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          }else if(reponse.toString()=="PASSWORD INCORECT"){
                                               final snackBar = SnackBar(
                                      content: Text("Incorrect password", style: TextStyle(color: Colors.white),),
                                      backgroundColor: Colors.red,
                                      );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          }else if(reponse.toString()=="EROR"){
                                               final snackBar = SnackBar(
                                    content: Text("Incorrect password", style: TextStyle(color: Colors.white),),
                                    backgroundColor: Colors.red,
                                    );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          }
                                          else{
                                             final snackBar = SnackBar(
                                    content: Text("Login Success", style: TextStyle(color: Colors.white),
                                    
                                    ),
                                    backgroundColor: Colors.green,
                                    );
                                    Get.to(() => HomeEntreprise());
                                          }
                                          
              
                                        }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                  primary: Color(0xff1E232C),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 120,
                    vertical: 20,
                  ),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Center(
                child: Row(children: [
                  Container(
                    width: (width / 3) - 30,
                    decoration: BoxDecoration(
                      color: Color(0xffE8ECF4),
                      border: Border(
                        bottom: BorderSide(color: Color(0xffE8ECF4)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Center(
                    child: Container(
                        child: Center(
                      child: Text("Or Login with"),
                    )),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: (width / 3) - 30,
                    decoration: BoxDecoration(
                      color: Color(0xffE8ECF4),
                      border: Border(
                        bottom: BorderSide(color: Color(0xffE8ECF4)),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 0, right: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        loginWithFacebook();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(
                                    5.0) //                 <--- border radius here
                                ),
                            border: Border.all(color: Color(0xffE8ECF4))),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/facebook.svg",
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {

                        auth_service.signInWithGoogle();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(
                                    5.0) //                 <--- border radius here
                                ),
                            border: Border.all(color: Color(0xffE8ECF4))),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/google_ic.svg",
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Center(
                  child: Row(
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: TextStyle(
                      color: Color(0xff1E232C),
                      fontSize: 12,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                        color: Color(0xff4092FF),
                        fontSize: 12,
                      ),
                    ),
                    onTap: () {
                      Get.to(() => Register());
                    },
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    ));
  }
}
