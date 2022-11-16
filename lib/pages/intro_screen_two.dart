import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mycab99/pages/intro_screen_three.dart';
import 'package:mycab99/pages/registration_screen.dart';

class introtwo extends StatefulWidget {
  const introtwo({ Key? key }) : super(key: key);

  @override
  _introtwo createState() => _introtwo();
}


class _introtwo extends State<introtwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 50),
            FadeInRight(
              duration: Duration(milliseconds: 1500),
              child: Lottie.network('https://assets4.lottiefiles.com/packages/lf20_svy4ivvy.json'
                ,fit: BoxFit.cover,),
            ),
            FadeInUp(
              duration: Duration(milliseconds: 1000),
              delay: Duration(milliseconds: 500),
              child: Container(
                  padding: EdgeInsets.only(left: 50, top: 40, right: 20, bottom: 50),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff0e0e0e).withOpacity(0.5),
                        offset: Offset(0, -5),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInUp(
                          duration: Duration(milliseconds: 1000),
                          delay: Duration(milliseconds: 1000),
                          from: 50,
                          child: Text(
                            'Best route for your journey',
                             style:GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)
                          ),
                        ),
                        SizedBox(height: 100),
                      ]
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}