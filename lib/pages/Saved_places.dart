import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class savedplaces extends StatefulWidget {
  const savedplaces({Key? key}) : super(key: key);

  @override
  State<savedplaces> createState() => _savedplacesState();
}

class _savedplacesState extends State<savedplaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 151, 151, 1),
        title: Text(
          'SAVED PLACES',
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
    );
  }
}
