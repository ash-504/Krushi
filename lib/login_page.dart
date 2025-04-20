import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'otp_page.dart';
import 'sign_up.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = "";

  void sendOTP() async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text}",

      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        Fluttertoast.showToast(msg: "Phone Number Verified Automatically");

        Navigator.pushReplacement(
          context,

          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1000),
            pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          ),
        );
      },

      verificationFailed: (FirebaseAuthException e) {
        Fluttertoast.showToast(msg: "Error: ${e.message}");
      },

      codeSent: (String verificationId, int? resendToken) {
        Navigator.pushReplacement(
          context,

          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1000),
            pageBuilder:
                (context, animation, secondaryAnimation) =>
                    OTPVerification(verificationId: verificationId),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          ),
        );
      },

      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 200,
                  bottom: 100,
                ),

                child: Text(
                  'Login Page',
                  style: TextStyle(
                    fontSize: 45,
                    color: Color.fromRGBO(12, 141, 3, 1),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter Phone Number',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                    ) 
                  ),

                  SizedBox(height: 20),

                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: "Enter Phone Number",
                      floatingLabelStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 1.5,
                        )
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ],
              )
            ),
            
            SizedBox(height: 150),

            ElevatedButton(
              onPressed: sendOTP,

              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(12, 141, 3, 1),
                foregroundColor: Color.fromRGBO(239, 239, 239, 1),
                padding: EdgeInsets.only(
                  left: 90,
                  right: 90,
                  top: 15,
                  bottom: 15,
                ),
                textStyle: TextStyle(
                  fontFamily: "Urbanist",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),

              child: Text("Get OTP"),
            ),

            SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.only(left: 90, right: 90, top: 5, bottom: 5),

              child: Divider(color: Colors.grey, thickness: 2),
            ),

            SizedBox(height: 10),

            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => SignUp()),
            //     );
            //   },

            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Color.fromRGBO(12, 141, 3, 1),
            //     foregroundColor: Color.fromRGBO(239, 239, 239, 1),
            //     padding: EdgeInsets.only(
            //       left: 90,
            //       right: 90,
            //       top: 15,
            //       bottom: 15,
            //     ),
            //     textStyle: TextStyle(
            //       fontFamily: "Urbanist",
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     elevation: 5,
            //   ),

            //   child: Text("Sign Up"),
            //),
          ],
        ),
      ),
    );
  }
}