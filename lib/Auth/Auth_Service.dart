import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lkhdma_lik/Entreprise/Account/Login.dart';
import 'package:lkhdma_lik/Entreprise/Home/Home.dart';

import '../API/Data_Function/Company_Account.dart';

class Auth_Service{

  //HandleAuthState()

  
  hanleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext, snapshot) {
      if(snapshot.hasData){
        Company_Account_API company_api = new Company_Account_API();
        
      print(company_api.save_google_account(FirebaseAuth.instance.currentUser!.email!));

        return HomeEntreprise();
      }else {
        return Login();
      }
      
    });
  }

  //sign In methode 
  signInWithGoogle() async {
    // Trigger the authentication flow 
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: <String>["email"]).signIn();

    //Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    //Create a new Credential 
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken, 
      accessToken: googleAuth.accessToken,
    );


    var connectionWithGmail = await FirebaseAuth.instance.signInWithCredential(credential);
    return connectionWithGmail;
    
  }


  //Sign Out method
  signOut(){
    FirebaseAuth.instance.signOut(); 
     
  }

}