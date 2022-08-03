import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lkhdma_lik/Entreprise/Hiring/Details_Candidate.dart';

class Saved_Candidate extends StatefulWidget {
  Saved_Candidate({Key? key}) : super(key: key);

  @override
  State<Saved_Candidate> createState() => _Saved_CandidateState();
}

class _Saved_CandidateState extends State<Saved_Candidate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
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
                      margin: EdgeInsets.only(left: 20),
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
                child: Text(
                  "Saved",
                  style: GoogleFonts.rubik(
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(top: 40),
                        height: 190,
                        width: 140,
                        child: Card(
                            elevation: 4,
                            child: Container(
                              padding: EdgeInsets.only(top: 45),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Oussama Shimi",
                                    style: TextStyle(
                                        fontFamily: "Urbanist",
                                        color: Color(0xff007AFF),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Text(
                                      "SoftWare engineer",
                                      style: TextStyle(
                                          fontFamily: "Urbanist",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Container(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Get.to(() =>
                                              Details_Candidat(idCandidat: 1));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                12), // <-- Radius
                                          ),
                                          primary: Color(0xff1E232C),
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        child: Text(
                                          "View Profil",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white, width: 6),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://img.etimg.com/thumb/msid-79622736,width-640,resizemode-4,imgsize-150765/microsoft.jpg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ])),
                    Container(
                        child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(top: 40),
                        height: 190,
                        width: 140,
                        child: Card(
                            elevation: 4,
                            child: Container(
                              padding: EdgeInsets.only(top: 45),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Oussama Shimi",
                                    style: TextStyle(
                                        fontFamily: "Urbanist",
                                        color: Color(0xff007AFF),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Text(
                                      "SoftWare engineer",
                                      style: TextStyle(
                                          fontFamily: "Urbanist",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Container(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Get.to(() =>
                                              Details_Candidat(idCandidat: 1));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                12), // <-- Radius
                                          ),
                                          primary: Color(0xff1E232C),
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        child: Text(
                                          "View Profil",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white, width: 6),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://img.etimg.com/thumb/msid-79622736,width-640,resizemode-4,imgsize-150765/microsoft.jpg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ]))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
