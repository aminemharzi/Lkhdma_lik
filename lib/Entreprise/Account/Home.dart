import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lkhdma_lik/Entreprise/Account/Login.dart';
import 'package:lkhdma_lik/Entreprise/Account/Register.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Center(
              child: Image.asset(
            "assets/images/logo.png",
            width: 250,
            height: 250,
          )),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => Login());
              },
              style: ElevatedButton.styleFrom(
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
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => Register());
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Color(0xff1E232C), width: 1),
                primary: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 110,
                  vertical: 20,
                ),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              child: Text(
                "Register",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
