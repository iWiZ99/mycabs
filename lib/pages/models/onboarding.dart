import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycab99/pages/intro_screen.dart';
import 'package:mycab99/pages/intro_screen_three.dart';
import 'package:mycab99/pages/intro_screen_two.dart';
import 'package:mycab99/pages/registration_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            intro(),
            introtwo(),
            introthree(),
          ],
        ),
        Container(
            alignment: Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Text('Skip',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          decoration: TextDecoration.none)),
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                ),
                SmoothPageIndicator(controller: _controller, count: 3,effect: ExpandingDotsEffect(
                  dotColor: Colors.black,
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Colors.red,
                ),),
                onLastPage
                    ? GestureDetector(
                        child: Text('Done',
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                decoration: TextDecoration.none)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registration()));
                        },
                      )
                    : GestureDetector(
                        child: Text(
                          'Next',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                      ),
              ],
            ),
        ),
      ],
    );
  }
}
