import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Krushi",
      theme: ThemeData(
        primaryColor: Color.fromRGBO(12, 141, 3, 1),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(12, 141, 3, 1),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(12, 141, 3, 1), width: 2),
          )
        ),
        scaffoldBackgroundColor: Color.fromRGBO(239, 239, 239, 1),
        fontFamily: 'Urbanist',
      ),

      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,

        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 1000),
          pageBuilder: (context, animation, secondaryAnimation) => IconPage(),
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

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,

        children: [
          Opacity(
            opacity: 0.3,
            child: Image.asset(
              "assets/images/wallpaper.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/logo/Logo.png",
                width: 200,
                height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
