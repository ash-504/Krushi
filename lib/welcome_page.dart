import 'package:flutter/material.dart';

import 'login_page.dart';

class IconPage extends StatefulWidget {


  @override
  State<IconPage> createState() => _IconPageState();
}

class _IconPageState extends State<IconPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,

        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 1000),
          pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,

        child: Padding(
          padding: EdgeInsets.only(top: 280),

          child: Column(
            children: [
              Image.asset("assets/logo/Logo.png", width: 200, height: 200),

              SizedBox(height: 20),

              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(12, 141, 3, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
