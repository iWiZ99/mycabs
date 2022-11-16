import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mycab99/pages/driver_details.dart';
import 'package:mycab99/pages/payments_screen.dart';

class availablecabs extends StatefulWidget {
  const availablecabs({Key? key}) : super(key: key);

  @override
  _availablecabs createState() => _availablecabs();
}

class _availablecabs extends State<availablecabs> {
  int selectedTool = 0;

  List<dynamic> tools = [
    {
      'image': 'assets/taxi1.png',
      'selected_image': 'assets/taxi1.png',
      'name': 'MyCabs Mini',
      'description': 'Economy ride',
      'Price': '₹251.73',
    },
    {
      'image': 'assets/taxi2.png',
      'selected_image': 'assets/taxi2.png',
      'name': 'MyCabs Sedan',
      'description': 'Comfortable Sedans',
      'Price': '₹291.73',
    },
    {
      'image': 'assets/totalpng 1.png',
      'selected_image': 'assets/totalpng 1.png',
      'name': 'MyCabs Moto',
      'description': 'Affordable, Motorcycle rides',
      'Price': '₹271.73',
    },
    {
      'image': 'assets/pngwing 1.png',
      'selected_image': 'assets/pngwing 1.png',
      'name': 'Luxury SUV',
      'description': 'Affordable, Luxury SUV rides',
      'Price': '₹261.73',
    },
    {
      'image': 'assets/mercedes-26188 1.png',
      'selected_image': 'assets/mercedes-26188 1.png',
      'name': 'Luxury Sedan',
      'description': 'Affordable, Luxury SUV rides',
      'Price': '₹241.73',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 151, 151, 1),
        title: Text(
          'AVAILABLE CABS',
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Mapsicle Map.png"),
              fit: BoxFit.cover,
            )
        ),
        height: double.infinity,
        child: Stack(
          children: [
            bottomDetailsSheet(),
          ],
        ),
      ),
    );
  }

  Widget CabListTile(int index) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          setState(() {
            selectedTool = index;
          });
        },
        selected: index == selectedTool,
      ),
    );
  }

  Widget bottomDetailsSheet() {
    return Stack(
      children: [
        DraggableScrollableSheet(
          initialChildSize: .5,
          minChildSize: .5,
          maxChildSize: .9,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Color.fromRGBO(20, 151, 151, 1),
              child: ListView.builder(
                controller: scrollController,
                itemCount: tools.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTool = index;
                      });
                    },
                    child: FadeInUp(
                      delay: Duration(milliseconds: index * 100),
                      child: AnimatedContainer(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        margin: EdgeInsets.only(bottom: 20),
                        duration: Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromRGBO(20, 151, 151, 1),
                                Color.fromRGBO(119, 193, 193, 1),
                                Color.fromRGBO(119, 193, 193, 1),
                                Color.fromRGBO(119, 193, 193, 1),
                                Color.fromRGBO(119, 193, 193, 1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(
                                color: selectedTool == index
                                    ? Color.fromRGBO(22, 73, 73, 1)
                                    : Colors.white.withOpacity(0),
                                width: 2),
                            boxShadow: [
                              selectedTool == index
                                  ? BoxShadow(
                                      color: Colors.transparent,
                                      offset: Offset(0, 3),
                                      blurRadius: 10)
                                  : BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(0, 3),
                                      blurRadius: 10)
                            ]),
                        child: Row(
                          children: [
                            selectedTool == index
                                ? Image.asset(
                                    tools[index]['selected_image'],
                                    width: 80,
                                  )
                                : Image.asset(
                                    tools[index]['image'],
                                    width: 80,
                                  ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tools[index]['name'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    tools[index]['description'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              tools[index]['Price'],
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.spaceEvenly,
              direction: Axis.horizontal,
              children: <Widget>[
                Container(

                    child: FloatingActionButton.extended(
                      autofocus: true,
                      label: Text(
                        "Cash >",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ), // <-- Text
                      backgroundColor: Color.fromRGBO(20, 151, 151, 1),
                      elevation: 4,
                      icon: Icon(
                        // <-- Icon
                        Icons.payments_outlined,
                        size: 15.0,
                      ),
                      shape:
                      BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => payments()));
                      },
                    ),),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: FloatingActionButton.extended(
                    label: Text(
                      "Coupons",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ), // <-- Text
                    backgroundColor: Color.fromRGBO(20, 151, 151, 1),
                    elevation: 14,
                    icon: Icon(
                      // <-- Icon
                      Icons.discount_outlined,
                      size: 15.0,
                    ),
                    shape:
                    BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                    onPressed: () {
                      showAdaptiveActionSheet(
                        context: context,
                        title: Text(
                          'Have a coupon?',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        actions: [
                          BottomSheetAction(
                            title: Text(
                              'Coupons',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            onPressed: (_) {
                              Navigator.of(context).pop('Coupons');
                            },
                            leading: Icon(
                              Icons.discount_outlined,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                          BottomSheetAction(
                            title: Text(
                              'Earn Coupons',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            onPressed: (_) {},
                            leading: Icon(
                              Icons.tag_faces_outlined,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ],
                        cancelAction: CancelAction(
                            title: Text(
                              'Cancel',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.indigoAccent),
                            )),
                      );
                    },
                  ),),

                Container(
                  child: FloatingActionButton.extended(
                    label: Text(
                      "Myself",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ), // <-- Text
                    backgroundColor: Color.fromRGBO(20, 151, 151, 1),
                    elevation: 14,
                    icon: Icon(
                      // <-- Icon
                      Icons.payments_outlined,
                      size: 15.0,
                    ),
                    shape:
                    BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                    onPressed: () {
                      showAdaptiveActionSheet(
                        context: context,
                        title: Text(
                          'Booking for someone else?',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        actions: [
                          BottomSheetAction(
                            title: Text(
                              'Myself',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            onPressed: (_) {
                              Navigator.of(context).pop('myself');
                            },
                            leading: Icon(
                              Icons.person_pin_circle_sharp,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                          BottomSheetAction(
                            title: Text(
                              'Choose a contact',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            onPressed: (_) {},
                            leading: Icon(
                              Icons.perm_contact_calendar_outlined,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ],
                        cancelAction: CancelAction(
                            title: Text(
                              'Cancel',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.indigoAccent),
                            )),
                      );
                    },
                  ),),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  child: FloatingActionButton.extended(
                    label: Text(
                      'Confirm MyCabs',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ), // <-- Text
                    backgroundColor: Color.fromRGBO(22, 73, 73, 1),
                    icon: Icon(
                      Icons.local_taxi_outlined,
                      size: 30.0,
                    ),
                    onPressed: () {
                      showAdaptiveActionSheet(
                        context: context,
                        title: Text(
                          'Contacting a driver',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        actions: [
                          BottomSheetAction(
                            title:
                              Lottie.network("https://assets9.lottiefiles.com/packages/lf20_p1bkxuf1.json"),
                            onPressed: (_){},
                            trailing: Text(
                              ""
                            )
                          ),
                          BottomSheetAction(
                            title: GestureDetector(
                              child: Text(
                                'Next',
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => driver()));
                              },
                            ),
                            onPressed: (_){},
                            leading: GestureDetector(
                              child: Icon(
                                Icons.tag_faces_outlined,
                                color: Colors.black,
                                size: 20,
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => driver()));
                              },
                            ),
                          ),
                        ],
                        cancelAction: CancelAction(
                            title: Text(
                              'Cancel',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.indigoAccent),
                            )),
                      );
                    },
                    shape:
                        BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
