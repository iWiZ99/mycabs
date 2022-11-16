import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class rides extends StatefulWidget {
  const rides({Key? key}) : super(key: key);

  @override
  State<rides> createState() => _ridesState();
}

class _ridesState extends State<rides> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 151, 151, 1),
        title: Text(
          'YOUR RIDES',
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
    );
  }
}
