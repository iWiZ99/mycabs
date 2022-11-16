import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycab99/pages/Available_cabs.dart';
import 'package:mycab99/pages/Saved_places.dart';

class searchlocation extends StatefulWidget {
  const searchlocation({Key? key}) : super(key: key);

  @override
  State<searchlocation> createState() => _searchlocationState();
}

class _searchlocationState extends State<searchlocation> {

  int currentStep = 0;
  continueStep() {
    if (currentStep < 2) {
      setState(() {
        currentStep = currentStep + 1; //currentStep+=1;
      });
    }
  }

  cancelStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep = currentStep - 1; //currentStep-=1;
      });
    }
  }

  onStepTapped(int value) {
    setState(() {
      currentStep = value;
    });
  }
  Widget controlBuilders(context, details) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: details.onStepContinue,
            child: const Text('Next'),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 151, 151, 1),
        title: Text(
          'SEARCH LOCATION',
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 15.0,bottom: 15.0,left: 10,right: 10),
            child: ElevatedButton(

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
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(
                    Icons.person_pin_circle_sharp,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Myself',
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                elevation: 4,
                primary:
                Color.fromRGBO(22, 73, 73, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)
                ),
              ),
            ),
          ),
        ],
      ),
      body:
      Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3), BlendMode.dstATop),
          image: AssetImage('assets/Mapsicle Map.png'),
          fit: BoxFit.cover,
        )),
        child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            shrinkWrap: true,
            children: [
              Stepper(
                elevation: 0, //Horizontal Impact
                // margin: const EdgeInsets.all(20), //vertical impact
                controlsBuilder: controlBuilders,
                type: StepperType.vertical,
                physics: const ScrollPhysics(),
                onStepTapped: onStepTapped,
                onStepContinue: continueStep,
                onStepCancel: cancelStep,
                currentStep: currentStep, //0, 1, 2
                steps: [
                  Step(
                      title:  Text('Enter pickup location',style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),),
                      content: Column(
                        children:  [
                          TextField(
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            onChanged: (text) {},
                            decoration: InputDecoration(
                              fillColor: Colors.white12,
                              filled: true,
                              hintText: "🟢 Enter Pickup Location",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.indigoAccent),
                              contentPadding: EdgeInsets.only(left: 30),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ],
                      ),

                      isActive: currentStep >= 0,
                      state:
                      currentStep >= 0 ? StepState.complete : StepState.disabled),
                  Step(
                    title: Text('Add Stop',style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),),
                    content: TextField(
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      onChanged: (text) {},
                      decoration: InputDecoration(
                        fillColor: Colors.white12,
                        filled: true,
                        hintText: "🟡 Add Stop",
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigoAccent),
                        contentPadding: EdgeInsets.only(left: 30),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                    isActive: currentStep >= 0,
                    state: currentStep >= 1 ? StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: const Text('Step 3'),
                    content: TextField(
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      onChanged: (text) {},
                      decoration: InputDecoration(
                        fillColor: Colors.white12,
                        filled: true,
                        hintText: "🟡 Add Stop",
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigoAccent),
                        contentPadding: EdgeInsets.only(left: 30),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                    isActive: currentStep >= 0,
                    state: currentStep >= 2 ? StepState.complete : StepState.disabled,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Container(
                      height: 40,
                      width: 180.0,
                      child: ElevatedButton(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.share_location_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Locate on map',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          primary: Color.fromRGBO(20, 151, 151, 1),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Container(
                      height: 40,
                      width: 255.0,
                      child: ElevatedButton(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.save,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Choose from saved places',
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
                                  builder: (context) => savedplaces()));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          primary: Color.fromRGBO(20, 151, 151, 1),
                        ),
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      height: 40,
                      width: 80.0,
                      child: ElevatedButton(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => availablecabs()));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          primary: Color.fromRGBO(20, 151, 151, 1),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
