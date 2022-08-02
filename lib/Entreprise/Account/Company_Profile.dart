import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Company_Profil extends StatefulWidget {
  Company_Profil({Key? key}) : super(key: key);

  @override
  State<Company_Profil> createState() => _Company_ProfilState();
}

class _Company_ProfilState extends State<Company_Profil> {
  var company_name = TextEditingController();
  var email = TextEditingController();
  var description = TextEditingController();
  var location = TextEditingController();
  var isEditing_name = false;
  var isEditing_location = false;
  var isEditing_email = false;
  var isEditing_description = false;

  var image_path;
  var converture_image;
  var company_iamge;

  _getFromGallery(int isConv) async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        if (isConv == 0) {
          converture_image = File(pickedFile.path);
        } else {
          company_iamge = File(pickedFile.path);
        }
      });

      image_path = pickedFile.path;
      print(image_path);
      print(converture_image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: company_iamge == null
                              ? NetworkImage(
                                  "https://img.freepik.com/free-photo/abstract-grunge-decorative-relief-navy-blue-stucco-wall-texture-wide-angle-rough-colored-background_1258-28311.jpg?w=2000")
                              : FileImage(company_iamge) as ImageProvider,
                          fit: BoxFit.cover),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 20),
                          //  margin: EdgeInsets.only(left: 20),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
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
                  Center(
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.only(top: 125),
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: converture_image == null
                                  ? NetworkImage(
                                      "https://img.etimg.com/thumb/msid-79622736,width-640,resizemode-4,imgsize-150765/microsoft.jpg")
                                  : FileImage(converture_image)
                                      as ImageProvider,
                              fit: BoxFit.cover),
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 125),
                      //   width: 130,
                      //   height: 130,
                      //   child: ClipRRect(
                      //     child: converture_image == null
                      //                   ? Image.network(
                      //       "https://img.etimg.com/thumb/msid-79622736,width-640,resizemode-4,imgsize-150765/microsoft.jpg",
                      //       fit: BoxFit.cover,
                      //     )
                      //                   : FileImage(converture_image) as ImageProvider,
                      //     borderRadius: BorderRadius.circular(60),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        //margin: EdgeInsets.only(top: 240, right: 20),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          GestureDetector(
                            onTap: () {
                              _getFromGallery(0);
                            },
                            child: SvgPicture.asset(
                                "assets/icons/add_a_photo.svg"),
                          ),
                          Text(
                            "Add couverture",
                            style:
                                TextStyle(fontFamily: "Urbanist", fontSize: 13),
                          )
                        ]),
                      ),
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 205, left: 20),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          GestureDetector(
                            child: SvgPicture.asset("assets/icons/view.svg"),
                          ),
                          Text(
                            "View as",
                            style:
                                TextStyle(fontFamily: "Urbanist", fontSize: 13),
                          )
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 205, right: 20),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          GestureDetector(
                            onTap: () {
                              _getFromGallery(1);
                            },
                            child: SvgPicture.asset(
                                "assets/icons/add_a_photo.svg"),
                          ),
                          Text(
                            "Add couverture",
                            style:
                                TextStyle(fontFamily: "Urbanist", fontSize: 13),
                          )
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Company’s name",
                      style: TextStyle(
                        fontFamily: "Urbanist",
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container()
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: company_name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff56545D),
                    fontWeight: FontWeight.w600,
                  ),
                  onChanged: (value) {
                    //_submit();
                  },
                  enableInteractiveSelection: isEditing_name,
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

                    hintText: isEditing_name == true ? "" : "Microsoft",
                    suffixIcon: Container(
                      width: 10,
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isEditing_name = true;
                          });
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      )),
                    ),

                    //make hint text
                    hintStyle: TextStyle(
                      // color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "Rubik Medium",
                      color: Colors.black,
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
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontFamily: "Urbanist",
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container()
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
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
                  enableInteractiveSelection: isEditing_email,
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

                    hintText:
                        isEditing_email == true ? "" : "amine.mharzi@gmail.com",
                    suffixIcon: Container(
                      width: 10,
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          print("Amine ");
                          setState(() {
                            isEditing_email = true;
                          });
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      )),
                    ),

                    //make hint text
                    hintStyle: TextStyle(
                      // color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "Rubik Medium",
                      color: Colors.black,
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
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Description",
                      style: TextStyle(
                        fontFamily: "Urbanist",
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container()
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  maxLines: 5,
                  minLines: 3,
                  controller: description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff56545D),
                    fontWeight: FontWeight.w600,
                  ),
                  onChanged: (value) {
                    //_submit();
                  },
                  enableInteractiveSelection: isEditing_description,
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

                    hintText: isEditing_description == true
                        ? ""
                        : "Une grande entreprise dans le secteur de IT ",
                    suffixIcon: Container(
                      width: 10,
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          print("Amine ");
                          setState(() {
                            isEditing_description = true;
                          });
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      )),
                    ),

                    //make hint text
                    hintStyle: TextStyle(
                      // color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "Rubik Medium",
                      color: Colors.black,
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
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Location",
                      style: TextStyle(
                        fontFamily: "Urbanist",
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container()
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: location,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff56545D),
                    fontWeight: FontWeight.w600,
                  ),
                  onChanged: (value) {
                    //_submit();
                  },
                  enableInteractiveSelection: isEditing_location,
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

                    hintText: isEditing_email == true ? "" : "My location",
                    suffixIcon: Container(
                      width: 10,
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isEditing_location = true;
                          });
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      )),
                    ),

                    //make hint text
                    hintStyle: TextStyle(
                      // color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "Rubik Medium",
                      color: Colors.black,
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 140,
                      vertical: 15,
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
            ],
          ),
        ),
      ),
    );
  }
}
