import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lkhdma_lik/Entreprise/Appointement/Set_Appointement.dart';

class Details_Candidat extends StatefulWidget {
  int idCandidat;
  Details_Candidat({Key? key, required this.idCandidat}) : super(key: key);

  @override
  State<Details_Candidat> createState() => _Details_CandidatState(idCandidat);
}

class _Details_CandidatState extends State<Details_Candidat> {
  int idCandidat;
  _Details_CandidatState(this.idCandidat);

  void modal_Rejects() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Center(
              child: Text("Reason"),
            ),
            content: Container(
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

                  hintText: "Reason",

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
            actions: <Widget>[
              TextButton(
                onPressed: () => {Navigator.of(context).pop(context)},
                child: const Text('Cancel'),
              ),
              Container(
                width: 120,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    primary: Color(0xff1E232C),
                    //padding: EdgeInsets.only(),
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
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );

  void modal_Accept() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Center(
              child: Text("Reason"),
            ),
            content: Container(
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

                  hintText: "Reason",

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
            actions: <Widget>[
              TextButton(
                onPressed: () => {Navigator.of(context).pop(context)},
                child: const Text('Cancel'),
              ),
              Container(
                width: 150,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => Set_Appointement());
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                      primary: Color(0xff1E232C),
                      //padding: EdgeInsets.only(),
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Appointement",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/icons/go.svg",
                          height: 15,
                          width: 15,
                        )
                      ],
                    )),
              ),
            ],
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                "Details",
                style: GoogleFonts.rubik(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: 106,
                height: 106,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  margin: EdgeInsets.only(top: 6, left: 5, right: 5, bottom: 6),
                  child: ClipRRect(
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx0CIy3mIbpe2nuLRfK5xxPcwxmTvXjJsBNw&usqp=CAU",
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50), // radius of 10
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 17,
                      //  fontWeight: ,
                      color: Color.fromARGB(255, 177, 178, 180),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    child: TextFormField(
                      enabled: false,
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
                            color: Color(0xFF8391A1),
                            width: 2.0,
                          ),
                        ),
                        fillColor: Color(0xFF7F8F9), filled: true,
                        focusColor: Color(0xFFF7F8F9),
                        //add prefix icon

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Color(0xFF8391A1), width: 0.5),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF8391A1), width: 0.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // fillColor: Colors.grey,

                        hintText: "Oussama shimi",

                        //make hint text
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: "Urbanist",
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
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Age",
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 17,
                      //  fontWeight: ,
                      color: Color.fromARGB(255, 177, 178, 180),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    child: TextFormField(
                      enabled: false,
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
                            color: Color(0xFF8391A1),
                            width: 2.0,
                          ),
                        ),
                        fillColor: Color(0xFF7F8F9), filled: true,
                        focusColor: Color(0xFFF7F8F9),
                        //add prefix icon

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Color(0xFF8391A1), width: 0.5),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF8391A1), width: 0.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // fillColor: Colors.grey,

                        hintText: "20",

                        //make hint text
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: "Urbanist",
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
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Number phone",
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 17,
                      //  fontWeight: ,
                      color: Color.fromARGB(255, 177, 178, 180),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    child: TextFormField(
                      enabled: false,
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
                            color: Color(0xFF8391A1),
                            width: 2.0,
                          ),
                        ),
                        fillColor: Color(0xFF7F8F9), filled: true,
                        focusColor: Color(0xFFF7F8F9),
                        //add prefix icon

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Color(0xFF8391A1), width: 0.5),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF8391A1), width: 0.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // fillColor: Colors.grey,

                        hintText: "+212666666666",

                        //make hint text
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: "Urbanist",
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
                ],
              ),
            ),
            SizedBox(height: 22),
            Center(
              child: Text(
                "Career",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Urbanist",
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: Color(0xffF7F8F9),
                borderRadius: BorderRadius.all(Radius.circular(
                        5.0) //                 <--- border radius here
                    ),
              ),
              width: 130,
              height: 38,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Year:",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Urbanist",
                          color: Color(0xff8391A1)),
                    ),
                    Text(
                      "2018",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Urbanist",
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 56,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Color(0xffF7F8F9),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Text(
                "Designer",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Urbanist",
                ),
              ),
            ),
            SizedBox(height: 22),
            Center(
              child: Text(
                "Skills",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Urbanist",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      modal_Rejects();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                      primary: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: Text(
                      "Reject",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      modal_Accept();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                      primary: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: Text(
                      "Accept",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        )),
      ),
    );
  }
}
