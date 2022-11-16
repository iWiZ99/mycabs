import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mycab99/pages/payments_screen.dart';
import 'package:mycab99/pages/support_screen.dart';

class driver extends StatefulWidget {
  const driver({Key? key}) : super(key: key);

  @override
  State<driver> createState() => _driverState();
}

class _driverState extends State<driver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 151, 151, 1),
        title: Text(
          'DRIVER DETAILS',
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/Mapsicle Map.png"),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: [
            bottomDetailsSheet(),
          ],
        ),
      ),
    );
  }

  Widget animalListTile(int index, String animalName) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          setState(() {});
        },
      ),
    );
  }

  Widget bottomDetailsSheet() {
    return Stack(
      children: [
        DraggableScrollableSheet(
          initialChildSize: .3,
          minChildSize: .2,
          maxChildSize: .99,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Color.fromRGBO(20, 151, 151, 1),
              child: ListView(
                controller: scrollController,
                children: [
                  ListTile(
                      title: Container(
                        child: Text(
                          "AS01JJKKLL",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                      subtitle: RichText(
                        // Controls visual overflow
                        overflow: TextOverflow.clip,

                        // Controls how the text should be aligned horizontally
                        textAlign: TextAlign.end,

                        // Control the text direction
                        textDirection: TextDirection.rtl,

                        // Whether the text should break at soft line breaks
                        softWrap: true,

                        // Maximum number of lines for the text to span
                        maxLines: 1,

                        // The number of font pixels for each logical pixel
                        textScaleFactor: 1,
                        text: TextSpan(
                          text: 'Range Rover ',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Orange',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      )),
                  ListTile(
                      title: Container(
                        child: Text(
                          "Philips Gold",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Rated ",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.yellow,
                              ),
                            ),
                            TextSpan(
                              text: " 4.9",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      )),
                  ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  "Contact",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ), // <-- Text
                                backgroundColor: Color.fromRGBO(22, 73, 73, 1),
                                elevation: 4,
                                icon: Icon(
                                  // <-- Icon
                                  Icons.phone,
                                  size: 12.0,
                                ),
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: FloatingActionButton.extended(
                                label: Text(
                                  "Cancel",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ), // <-- Text
                                backgroundColor: Color.fromRGBO(22, 73, 73, 1),
                                elevation: 14,
                                icon: Icon(
                                  // <-- Icon
                                  Icons.cancel_outlined,
                                  size: 12.0,
                                ),
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                                onPressed: () {
                                  
                                },
                              ),
                            ),
                            Container(
                              child: FloatingActionButton.extended(
                                label: Text(
                                  "Support",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ), // <-- Text
                                backgroundColor: Color.fromRGBO(22, 73, 73, 1),
                                elevation: 12,
                                icon: Icon(
                                  // <-- Icon
                                  Icons.support_agent_rounded,
                                  size: 15.0,
                                ),
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => support()));
                                },
                              ),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                              height: 40,
                              width: double.infinity,
                              child: TextField(
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                                onChanged: (text) {},
                                decoration: InputDecoration(
                                  fillColor: Color.fromRGBO(10, 112, 112, 1),
                                  filled: true,
                                  hintText:
                                      "🟢 Khanapara,Khanapara,Ghy,Assam,785640",
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                  contentPadding: EdgeInsets.only(left: 30),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              height: 40,
                              width: double.infinity,
                              child: TextField(
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                                onChanged: (text) {},
                                decoration: InputDecoration(
                                  fillColor: Color.fromRGBO(10, 112, 112, 1),
                                  filled: true,
                                  hintText: "🔴 Seuj Nagar,Ghy,Assam,785640",
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                  contentPadding: EdgeInsets.only(left: 30),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  height: 40,
                                  width: double.infinity,
                                  child: Text(
                                    "Total Fare Rs.157",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ),
                                Wrap(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      height: 40,
                                      width: 29,
                                      color: Colors.white,
                                      child: Icon(
                                        Icons.currency_rupee,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      height: 40,
                                      width: 60,
                                      color: Colors.white,
                                      child: Text(
                                        "Cash",
                                        style: GoogleFonts.poppins(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      height: 40,
                                      width: 167,
                                      color: Colors.white,
                                      child: Text(
                                        "Pay when the ride ends",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      height: 40,
                                      width: 72,
                                      color: Colors.white,
                                      child: GestureDetector(
                                        child: Text(
                                          "Change",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.indigoAccent),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      payments()));
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  height: 50,
                                  width: double.infinity,
                                  child: Text(
                                    "Get exciting offers with MyCabs",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.all(10),
                                    height: 300,
                                    width: double.infinity,
                                    child: Lottie.network(
                                        "https://assets3.lottiefiles.com/packages/lf20_yseim94k.json")),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
