import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lkhdma_lik/Entreprise/Account/Login.dart';

class Success_Changed_Password extends StatefulWidget {
  Success_Changed_Password({Key? key}) : super(key: key);

  @override
  State<Success_Changed_Password> createState() =>
      _Success_Changed_PasswordState();
}

class _Success_Changed_PasswordState extends State<Success_Changed_Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: SvgPicture.asset(
              "assets/icons/Successmark.svg",
              width: 100,
              height: 100,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Password Changed!",
            style: GoogleFonts.rubik(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.only(left: 80, right: 80),
              child: Text(
                "Your password has been changed successfully.",
                style:
                    GoogleFonts.rubik(color: Color(0xff8391A1), fontSize: 14),
              )),
          SizedBox(
            height: 30,
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => Login());
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
                primary: Color(0xff1E232C),
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 20,
                ),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              child: Text(
                "Back to Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
