import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycab99/pages/intro_screen.dart';
import 'package:mycab99/pages/models/onboarding.dart';
import 'package:page_transition/page_transition.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        backgroundColor: Color.fromRGBO(20, 151, 151, 1),
        splash: Column(
          children: [
            Image.asset('assets/Red Black only Logo 1.png'),
            Text('My Cabs',style:GoogleFonts.poppins(fontSize:
            20,fontWeight: FontWeight.w600,color: Colors.white),),
            SizedBox(height: 5,),
            Text('Always there for you',style:GoogleFonts.poppins(fontSize:
            26,fontWeight: FontWeight.w600,color: Colors.white),)
          ],
        ),
        nextScreen: OnBoarding(),
        splashIconSize: 150,
        duration: 1000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
      ),
    );
  }
}
