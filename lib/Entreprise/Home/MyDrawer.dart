import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lkhdma_lik/Entreprise/Account/Company_Profile.dart';
import 'package:lkhdma_lik/Entreprise/Account/Setting.dart';
import 'package:lkhdma_lik/Entreprise/Jobs/AddJob.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Future<Widget> getAssetSvg(String path) async {
    try {
      await rootBundle.load(path);
      return SvgPicture.asset(path);
    } catch (_) {
      return Icon(Icons.home); // Return this widget
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xffF7F8F9),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Container(
              padding: EdgeInsets.only(top: 30),
              height: 185,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Text("Amine Mharzi", style: GoogleFonts.rubik(fontSize: 18))
                ],
              )),
          Container(
            color: Color(0xffFFFFFF),
            child: ListTile(
              leading: Icon(Icons.people),
              title: Text('Profile'),
              onTap: () {
                Get.to(() => Company_Profil());
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Color(0xffFFFFFF),
            child: ListTile(
              // leading: SvgPicture.asset("assets/icons/Profile.svg"),
              leading: Icon(Icons.work),
              title: const Text('Jobs'),
              onTap: () {
                Get.to(() => AddJob());
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Color(0xffFFFFFF),
            child: ListTile(
              // leading: SvgPicture.asset("assets/icons/Profile.svg"),
              leading: Icon(Icons.reply),
              title: const Text('Reply'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Color(0xffFFFFFF),
            child: ListTile(
              leading: Icon(Icons.archive),
              //  leading: SvgPicture.asset("assets/icons/Profile.svg"),
              title: const Text('Saved'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(
            height: 90,
          ),
          Divider(
            color: Color(0xfFBDC5CD),
            height: 2,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {
                Get.to(() => Setting());
              },
              child: Text("Settings and privacy",
                  style: GoogleFonts.rubik(fontSize: 14)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {},
              child:
                  Text("Help Center", style: GoogleFonts.rubik(fontSize: 14)),
            ),
          )
        ],
      ),
    );
  }
}
