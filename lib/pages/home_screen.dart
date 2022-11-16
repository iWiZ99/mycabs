import 'package:animate_do/animate_do.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycab99/pages/form.dart';
import 'package:mycab99/pages/models/SOS.dart';
import 'package:mycab99/pages/models/Drawer_items.dart';
import 'package:mycab99/pages/new%20search%20location.dart';
import 'package:mycab99/pages/search_location.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    TimeOfDay _time = TimeOfDay.now().replacing(hour: 10, minute: 00);
    bool iosStyle = true;

    void onTimeChanged(TimeOfDay newTime) {
      setState(() {
        _time = newTime;
      });
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: draweritems(),
      // endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      //body: Maps()
      body: FadeIn(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
            'assets/Mapsicle Map.png',
          ))),
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FadeIn(
                      duration: Duration(milliseconds: 1500),
                      child: Container(
                        height: 280,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(22, 73, 73, 1),
                              Color.fromRGBO(20, 151, 151, 1),
                              Color.fromRGBO(10, 112, 112, 1),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff0e0e0e).withOpacity(1),
                              offset: Offset(0, -3),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 80,
                            ),
                            Image.asset('assets/Red Black only Logo 1.png'),
                            Text(
                              'MyCabs',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Let's go for a ride",
                              style: GoogleFonts.poppins(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DraggableScrollableSheet(
                  initialChildSize: 0.35,
                  minChildSize: 0.2,
                  maxChildSize: 1.0,
                  builder: (BuildContext context, myscrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(22, 73, 73, 1),
                            Color.fromRGBO(20, 151, 151, 1),
                            Color.fromRGBO(10, 112, 112, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(25.0),
                          topRight: const Radius.circular(25.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff0e0e0e).withOpacity(1),
                            offset: Offset(0, -3),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 50,
                                child: Divider(
                                  color: Color.fromRGBO(20, 151, 151, 1),
                                  thickness: 3,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 30,
                                    width: 50,
                                    child: ElevatedButton(
                                      child: Wrap(
                                        crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.search,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    new_search()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 4,
                                        primary:
                                        Color.fromRGBO(20, 151, 151, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(0.0)
                                        ),
                                      ),
                                    )),
                                Container(
                                  color: Colors.white,
                                  width: 10,
                                  height: 30,
                                ),

                                Container(
                                    height: 30,
                                    width: 206,
                                    child: ElevatedButton(
                                      child: Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(

                                            'Search Location',
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    new_search()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 4,
                                        primary:
                                            Color.fromRGBO(20, 151, 151, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(0.0)
                                        ),
                                      ),
                                    )),
                                Container(
                                  color: Colors.white,
                                  width: 10,
                                  height: 30,
                                ),
                                Container(
                                    height: 30,
                                    width: 84,
                                    child: ElevatedButton(
                                      child: Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.watch_later,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            'Now',
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          showPicker(
                                            context: context,
                                            value: _time,
                                            onChange: onTimeChanged,
                                            minuteInterval: MinuteInterval.FIVE,
                                            // Optional onChange to receive value as DateTime
                                            onChangeDateTime:
                                                (DateTime dateTime) {
                                              // print(dateTime);
                                              debugPrint(
                                                  "[debug datetime]:  $dateTime");
                                            },
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 4,
                                        primary:
                                            Color.fromRGBO(20, 151, 151, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(0.0)
                                      ),

                                      ),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 70,
                            color: Color.fromRGBO(10, 112, 112, 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: Image.asset(
                                          'assets/taxi1.png',
                                        ),
                                        onTap: () {},
                                      ),
                                      Text('Daily',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: Image.asset('assets/taxi2.png'),
                                        onTap: () {},
                                      ),
                                      Text('Rentals',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: Image.asset('assets/taxi1.png'),
                                        onTap: () {},
                                      ),
                                      Text(
                                        'Outstation',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              height: 50,
                              width: 480,
                              child: ElevatedButton(
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                      'Gopinath Bordoloi Nagar, Jalukbari, Guwahati',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              new_search()));
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  primary: Color.fromRGBO(119, 193, 193, 1),
                                ),
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              height: 50,
                              width: 480,
                              child: ElevatedButton(
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                      'Jalukbari Road, Guwahati, Assam',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              new_search()));
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  primary: Color.fromRGBO(119, 193, 193, 1),
                                ),
                              )),
                        ],
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 275.0,left:301),
                child: SpeedDial(
                  animatedIcon: AnimatedIcons.menu_close,
                  animatedIconTheme: IconThemeData(size: 28.0),
                  backgroundColor: Color.fromRGBO(20, 151, 151, 1),
                  visible: true,
                  curve: Curves.fastLinearToSlowEaseIn,
                  children: [
                    SpeedDialChild(
                      child: Icon(Icons.local_police_rounded, color: Colors.white),
                      backgroundColor: Color.fromRGBO(20, 151, 151, 1),
                      onTap: () {},
                      label: 'POLICE',
                      labelStyle:
                      GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      labelBackgroundColor: Color.fromRGBO(20, 151, 151, 1),
                    ),
                    SpeedDialChild(
                      child: Icon(Icons.emergency_outlined, color: Colors.white),
                      backgroundColor: Color.fromRGBO(20, 151, 151, 1),
                      onTap: () {
                      },
                      label: 'AMBULANCE',
                      labelStyle:
                      GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      labelBackgroundColor: Color.fromRGBO(20, 151, 151, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
