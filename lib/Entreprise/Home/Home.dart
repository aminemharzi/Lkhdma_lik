import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lkhdma_lik/Entreprise/Hiring/Details_Candidate.dart';
import 'package:lkhdma_lik/Entreprise/Home/MyDrawer.dart';

class HomeEntreprise extends StatefulWidget {
  HomeEntreprise({Key? key}) : super(key: key);

  @override
  State<HomeEntreprise> createState() => _HomeEntrepriseState();
}

class _HomeEntrepriseState extends State<HomeEntreprise> {
  var selectedIndex = 0;
  List list1 = [
    "assets/images/personne1.jpg",
    "assets/images/personne2.jpg",
    "assets/images/personne3.jpg",
    "assets/images/personne4.jpg",
  ];
  List list2 = [
    "assets/images/personne1.jpg",
    "assets/images/personne2.jpg",
    "assets/images/personne3.jpg",
    "assets/images/personne4.jpg",
  ];
  Widget card(String photo, String name) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: Container(
            height: 60,
            width: 60,
            child: ClipRRect(
              child: Image.asset(
                photo,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          title: Text(name,
              style:
                  GoogleFonts.rubik(fontWeight: FontWeight.bold, fontSize: 13)),
        ));
  }

  Widget displayData(int index) {
    if (index == 0) {
      return SingleChildScrollView(
          child: ListView.builder(
              padding: EdgeInsets.only(top: 0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: list1.length,
              itemBuilder: (context, index) => Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => Details_Candidat(idCandidat: 1));
                        },
                        child: Container(
                          child: Image.asset(
                            list1[index],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => Details_Candidat(idCandidat: 1));
                        },
                        child: Container(
                          child: Image.asset(
                            list1[index++],
                          ),
                        ),
                      )
                    ],
                  )));
    } else {
      return SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: list2.length,
              itemBuilder: (context, index) =>
                  card(list2[index], "Amine MHARZI")));
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print("The google name"+FirebaseAuth.instance.currentUser!.displayName!);
  }
  List jobs = ["Designer", "Programmer", "Photographer", "Data Analyst"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Color(0xff000000),
          title: Center(child: Text("Home")),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              tooltip: 'Comment Icon',
              onPressed: () {},
            ), //IconButton
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Setting Icon',
              onPressed: () {},
            ), //IconButton
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: TextFormField(
                    // controller: user_name,
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      color: Color(0xff56545D),
                      fontWeight: FontWeight.w600,
                    ),
                    onChanged: (value) {},

                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
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
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // fillColor: Colors.grey,

                      hintText: "Position, location or keywords",
                      prefixIcon: Icon(Icons.search),

                      //make hint text
                      hintStyle: TextStyle(
                        // color: Colors.grey,
                        fontSize: 14,
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
                Text("Job",
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 29,
                    )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 23,
                  child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 0),
                      scrollDirection: Axis.horizontal,
                      itemCount: jobs.length,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? Color(0xffD9D9D9)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              margin: EdgeInsets.only(right: 8),
                              child: Center(
                                child: Text(
                                  jobs[index],
                                  style: GoogleFonts.rubik(
                                    color: selectedIndex != index
                                        ? Color(0xff8391A1)
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          )),
                ),
                SizedBox(
                  height: 15,
                ),
                // displayData(selectedIndex),
                Container(
                  margin: EdgeInsets.only(right: 20),
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
                                            Get.to(() => Details_Candidat(
                                                idCandidat: 1));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                            Get.to(() => Details_Candidat(
                                                idCandidat: 1));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
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
                Container(
                  margin: EdgeInsets.only(right: 20),
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
                                            Get.to(() => Details_Candidat(
                                                idCandidat: 1));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                            Get.to(() => Details_Candidat(
                                                idCandidat: 1));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
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
                Container(
                  margin: EdgeInsets.only(right: 20),
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
                                            Get.to(() => Details_Candidat(
                                                idCandidat: 1));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                            Get.to(() => Details_Candidat(
                                                idCandidat: 1));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
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
                Container(
                  margin: EdgeInsets.only(right: 20),
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
                                            Get.to(() => Details_Candidat(
                                                idCandidat: 1));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                            Get.to(() => Details_Candidat(
                                                idCandidat: 1));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
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
        ));
  }
}
