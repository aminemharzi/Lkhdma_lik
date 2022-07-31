import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lkhdma_lik/Entreprise/Account/Forgot_Passw.dart';
import 'package:lkhdma_lik/Entreprise/Account/Suucess_Change_Password.dart';

class Create_New_Password extends StatefulWidget {
  Create_New_Password({Key? key}) : super(key: key);

  @override
  State<Create_New_Password> createState() => _Create_New_PasswordState();
}

class _Create_New_PasswordState extends State<Create_New_Password> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.only(left: 22, right: 22),
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
            Center(
                child: Text("Create new password",
                    //textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1E232C)))),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
                    "Your new password must be unique from those previously used.",
                    // textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        fontSize: 14, color: Color(0xff8391A1)))),
            SizedBox(
              height: 32,
            ),
            TextFormField(
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

                hintText: "New Password",

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
                  return "Ce champs est obligatoire";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
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
                  return "Ce champs est obligatoire";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => Success_Changed_Password());
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
                  "Reset Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
