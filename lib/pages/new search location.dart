import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycab99/pages/form.dart';

import 'Available_cabs.dart';
import 'Saved_places.dart';

class new_search extends StatefulWidget {
  const new_search({Key? key}) : super(key: key);

  @override
  State<new_search> createState() => _new_search();
}

class _new_search extends State<new_search> {
  static const _steps = [
    Step(
      title: Text('Pickup'),
      content: _AddressForm(),
    ),
    Step(
      title: Text('Add Stop'),
      content: _CardForm(),
    ),
    Step(
      title: Text('Destination'),
      content: _Overview(),
    )
  ];
  int _currentStep = 0;
  bool complete = false;

  next() {
    _currentStep + 1 != _steps.length
        ? goTo(_currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (_currentStep > 0) {
      goTo(_currentStep - 1);
    }
  }

  goTo(int _step) {
    setState(() => _currentStep = _step);
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
            padding:
                EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10, right: 10),
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
                primary: Color.fromRGBO(22, 73, 73, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
              ),
            ),
          ),
        ],
      ),
      body: Column(children: [
        complete
            ? Expanded(
                child: Center(
                child: AlertDialog(
                  title: Text("Here Maps",style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),),
                  actions: [
                    Container(
                        height: 40,
                        width: 80.0,
                        child: ElevatedButton(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text('Edit',style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),),
                            ],
                          ),
                            onPressed: () {
                              setState(() => complete = false);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 4,
                            primary: Color.fromRGBO(20, 151, 151, 1),
                          ),
                        )),
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
              ))
            : Expanded(
                child: Stepper(
                  currentStep: _currentStep,
                  steps: _steps,
                  onStepContinue: next,
                  onStepTapped: goTo,
                  onStepCancel: cancel,
                ),
              ),
        Padding(
          padding: const EdgeInsets.only(left: 250,bottom: 20),
          child: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: IconThemeData(size: 28.0),
            backgroundColor: Color.fromRGBO(20, 151, 151, 1),
            visible: true,
            curve: Curves.fastLinearToSlowEaseIn,
            children: [
              SpeedDialChild(
                child: Icon(Icons.save, color: Colors.white),
                backgroundColor: Color.fromRGBO(20, 151, 151, 1),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => savedplaces()));
                },
                label: 'Saved places',
                labelStyle:
                GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                labelBackgroundColor: Color.fromRGBO(20, 151, 151, 1),
              ),
              SpeedDialChild(
                child: Icon(Icons.share_location_rounded, color: Colors.white),
                backgroundColor: Color.fromRGBO(20, 151, 151, 1),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()));
                },
                label: 'Locate on map',
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
      ]),
    );
  }
}

class _AddressForm extends StatelessWidget {
  const _AddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
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
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}

class _CardForm extends StatelessWidget {
  const _CardForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
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
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
          onChanged: (text) {},
          decoration: InputDecoration(
            fillColor: Colors.white12,
            filled: true,
            hintText: "🔴 Destination",
            hintStyle: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.indigoAccent),
            contentPadding: EdgeInsets.only(left: 30),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}
