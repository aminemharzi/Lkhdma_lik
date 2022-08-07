import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddJob extends StatefulWidget {
  AddJob({Key? key}) : super(key: key);

  @override
  State<AddJob> createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  var _formKey = new GlobalKey<FormState>();

  var default_level = "Study level";
  //var study_levels = ["Bac", "Bac+2", "Bac+3", "Bac+5"];
  @override
  Widget build(BuildContext context) {
    double width= (MediaQuery.of(context).size.width)-40;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.only(left: 20),
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
                  "Add Job",
                  style: GoogleFonts.rubik(
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                key: _formKey,
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
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
                          borderSide:
                              BorderSide(color: Color(0xFFF2F3F9), width: 1.0),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFF2F3F9), width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // fillColor: Colors.grey,

                        hintText: "job name",

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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
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
                          borderSide:
                              BorderSide(color: Color(0xFFF2F3F9), width: 1.0),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFF2F3F9), width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // fillColor: Colors.grey,

                        hintText: "City",

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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
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
                          borderSide:
                              BorderSide(color: Color(0xFFF2F3F9), width: 1.0),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFF2F3F9), width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // fillColor: Colors.grey,

                        hintText: "Salary",
                        suffixIcon: Container(
                          width: 10,
                          child: Center(
                            child: Text(
                              "\$",
                              style: GoogleFonts.rubik(fontSize: 15),
                            ),
                          ),
                        ),

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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 2,
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
                          borderSide:
                              BorderSide(color: Color(0xFFF2F3F9), width: 1.0),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFF2F3F9), width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // fillColor: Colors.grey,

                        hintText: "Work hours",

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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
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
                          borderSide:
                              BorderSide(color: Color(0xFFF2F3F9), width: 1.0),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFF2F3F9), width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // fillColor: Colors.grey,

                        hintText: "Level of study",

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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      minLines: 3,
                      maxLines: 4,
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
                          borderSide:
                              BorderSide(color: Color(0xFFF2F3F9), width: 1.0),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFF2F3F9), width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // fillColor: Colors.grey,

                        hintText: "Experience",

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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                Container(
                margin: EdgeInsets.only(right: 20, left: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    primary: Color(0xff1E232C),
                    padding:  EdgeInsets.only(
                      left: (width/2)-25,
                      right: (width/2)-25,
                      top: 16,
                      bottom: 
                      16,
                    ),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
                  SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
