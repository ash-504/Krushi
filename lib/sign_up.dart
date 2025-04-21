import 'package:flutter/material.dart';

import 'farmer_personal_details.dart';
import 'customer_personal_details.dart';
import 'partner_personal_details.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Text(
                "You Are A...",
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromRGBO(12, 141, 3, 1),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            SizedBox(height: 15),

            buildNavigationButton(context, "Farmer", FarmerPersonalDetails()),

            SizedBox(height: 20),

            buildNavigationButton(context, "Customer", CustomerPersonalDetails()),

            SizedBox(height: 20),

            buildNavigationButton(context, "Partner", PartnerPersonalDetails()),
          ],
        )
      ),
    );
  }

  Widget buildNavigationButton (BuildContext context, String title, Widget page) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
          width: 260,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) => page,
                  transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                ),
              );
            }, 

            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(230, 230, 230, 1),
              foregroundColor: Color.fromRGBO(12, 141, 3, 1),
              side: BorderSide(color: Color.fromRGBO(12, 141, 3, 1), width: 2),
              textStyle: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              elevation: 1.5,
            ),
            child: Text(title),
          ),
        ),
      );
    }
}