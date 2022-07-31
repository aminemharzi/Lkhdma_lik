import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lkhdma_lik/Entreprise/Account/Company_Info.dart';
import 'package:lkhdma_lik/Entreprise/Account/Login.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.only(left: 22),
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
                child: Text("Hello! Register to get started",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1E232C)))),
            SizedBox(
              height: 32,
            ),
            TextFormField(
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

                hintText: "Username",

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

                hintText: "Email",

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

                hintText: "Password",

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

                hintText: "Confirm password",

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
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => Company_Info());
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
                  "Register",
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
                    width: (width / 4) - 30,
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
                      child: Text("Or Register with"),
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
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 0, right: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
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
                      onTap: () {},
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
                    "Already have an account? ",
                    style: TextStyle(
                      color: Color(0xff1E232C),
                      fontSize: 12,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      "Login Now",
                      style: TextStyle(
                        color: Color(0xff4092FF),
                        fontSize: 12,
                      ),
                    ),
                    onTap: () {
                      Get.to(() => Login());
                    },
                  ),
                ],
              )),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    ));
  }
}
