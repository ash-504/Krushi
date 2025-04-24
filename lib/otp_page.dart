import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:krushi/sign_up.dart';
import 'package:pinput/pinput.dart';

import 'customer_home.dart';
import 'farmer_home.dart';
import 'partner_home.dart';

class OTPVerification extends StatefulWidget {
  final String verificationId;
  OTPVerification({required this.verificationId});

  @override
  _OTPVerificationPage createState() => _OTPVerificationPage();
}

class _OTPVerificationPage extends State<OTPVerification> {
  final TextEditingController otpController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  void verifyOTP() async {
    try {
      String otp = otpController.text.trim();
      print("Entered OTP: $otp");

      if (otp.length != 6) {
        Fluttertoast.showToast(msg: "Enter 6-digit OTP");
        return;
      }

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otp,
      );

      UserCredential userCredential = await auth.signInWithCredential(
        credential,
      );
      String uid = userCredential.user!.uid;

      print("Verification successful! User: ${userCredential.user?.uid}");
      Fluttertoast.showToast(msg: "Phone Verified Successfully!");

      final docSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (docSnapshot.exists) {
        final role = docSnapshot.data()?['role'];
        print("User role: $role");

        Widget landingPage;
        if (role == 'farmer') {
          landingPage = FarmerHome();
        } else if (role == 'customer') {
          landingPage = CustomerHome();
        } else if (role == 'partner') {
          landingPage = DeliveryHomePage();
        } else {
          landingPage = SignUp();
        }

        Navigator.pushReplacement(
          context,

          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1000),
            pageBuilder:
                (context, animation, secondaryAnimation) => landingPage,
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
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => SignUp()),
        );
      }
    } catch (e) {
      print("Error during OTP verification: $e");
      Fluttertoast.showToast(msg: "Invalid OTP. Try Again!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                'Enter OTP',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 45,
                  color: Color.fromRGBO(12, 141, 3, 1),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          Pinput(
            length: 6,
            controller: otpController,
            keyboardType: TextInputType.number,
            autofocus:true,
            defaultPinTheme: PinTheme(
              width: 50,
              height: 50,
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(12, 141, 3, 1)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            onCompleted: (pin) {
              print("Entered OTP: $pin");
            },
          ),

          SizedBox(height: 50),

          ElevatedButton(
            onPressed: verifyOTP,

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

            child: Text("Verify OTP"),
          ),
        ],
      ),
    );
  }
}
