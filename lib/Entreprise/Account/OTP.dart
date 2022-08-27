import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lkhdma_lik/Entreprise/Account/Create_New_Password.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTP extends StatefulWidget {
   String email ;
  OTP({Key? key, required this.email}) : super(key: key);
 
  

  @override
  State<OTP> createState() => _OTPState(email);
}

class _OTPState extends State<OTP> {
  String email;
  _OTPState(this.email);
 

  OtpFieldController otpController = OtpFieldController();
  var isClicked = false;
  var otp = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendOtp();
     

  }
  
   EmailAuth emailAuth = new EmailAuth(
      sessionName: "Sample session",
    );


  /// a void funtion to send the OTP to the user
  /// Can also be converted into a Boolean function and render accordingly for providers
  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: email, otpLength: 4);
    if (result) {
      print("OTP is sent");
    }
  }

   void verify() {
    var isValidOtp = emailAuth.validateOtp(
        recipientMail: email,
        userOtp: otp.value.text);
        if(isValidOtp){
           Get.to(() => Create_New_Password(email: email,));


        }else{
           final snackBar = SnackBar(
                  content: Text("Code is not correct", style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.red,
                  );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          otpController.clear();


        }

  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
            Container(
                child: Text("OTP Verification",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.rubik(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1E232C)))),
            SizedBox(
              height: 15,
            ),
            Container(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: Text(
                    "Enter the verification code we just sent on your email address.",
                    // textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        fontSize: 14, color: Color(0xff8391A1)))),
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              width:width,
              child: OTPTextField(
                  length: 6,
                  controller: otpController,
                  fieldWidth: 50,
                  style: TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 15,
                  onChanged: (pin) {
                    print("Changed: " + pin);
                  },
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                    otp.text = pin;
                  },
                  otpFieldStyle: OtpFieldStyle(
                    borderColor: Color(0xff35C2C1),
                  )),
            ),
            SizedBox(
              height: 38,
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: ElevatedButton(
                onPressed: () {
                 
                  verify();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                  primary: Color(0xff1E232C),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 20,
                  ),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                child: Text(
                  "Verify",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              margin: EdgeInsets.only(left: 70, top: height / 4),
              child: Center(
                  child: Row(
                children: [
                  Text(
                    "Didn’t received code? ",
                    style: TextStyle(
                      color: Color(0xff1E232C),
                      fontSize: 12,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      "Resend",
                      style: TextStyle(
                        color: Color(0xff4092FF),
                        fontSize: 12,
                      ),
                    ),
                    onTap: () {
                      sendOtp();
                    },
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    ));
  }
}
