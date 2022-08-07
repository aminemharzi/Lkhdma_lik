import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lkhdma_lik/Auth/Auth_Service.dart';
import 'package:lkhdma_lik/Entreprise/Account/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  RxBool isLight = false.obs;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  _saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', isLight.value);
  }

  _getThemeStatus() async {
    var _isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
    });

    isLight.value = (await _isLight)!;
    Get.changeThemeMode(isLight.value ? ThemeMode.light : ThemeMode.dark);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  "Setting",
                  style: TextStyle(
                    fontSize: 22,
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
                  Container(),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        child: Text(
                          "Done",
                          style: TextStyle(
                            color: Color(0xff4C9EEB),
                            fontSize: 18,
                            fontFamily: "Urbanist",
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 42,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "Urbanist",
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Color(0xff687684),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 42,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Privacy",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "Urbanist",
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Color(0xff687684),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 42,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Notifications",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "Urbanist",
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Color(0xff687684),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 42,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Content preferences",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "Urbanist",
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Color(0xff687684),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 10),
                color: Color(0xffE7ECF0),
                width: double.infinity,
                height: 40,
                child: Text(
                  "Other",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff687684),
                    fontSize: 18,
                    fontFamily: "Urbanist",
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 42,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "theme",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "Urbanist",
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Color(0xff687684),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Appearance:",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Urbanist",
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isLight.value = true;
                            _saveThemeStatus();
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 30,
                          child: Card(
                            elevation: isLight.value ? 3 : 0,
                            child: Image.asset("assets/images/light.png"),
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isLight.value = false;
                            _saveThemeStatus();
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 30,
                          child: Card(
                            elevation: !isLight.value ? 3 : 0,
                            child: Image.asset("assets/images/dark.png"),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (){
                  Auth_Service().signOut();
                 
                },
                child:  Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Logout",
                  style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 18,
                      color: Color(0xff007AFF)),
                ),
              ),
              ),
             
              InkWell(
                onTap: () {},
                child: Container(
                  height: 42,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "About App",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "Urbanist",
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Color(0xff687684),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
