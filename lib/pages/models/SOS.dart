import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class sos extends StatefulWidget {
  const sos({Key? key}) : super(key: key);

  @override
  State<sos> createState() => _sos();
}

class _sos extends State<sos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book your cab'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    primary: Colors.orangeAccent
                ),
                onPressed: () {
                  final action = CupertinoActionSheet(
                    title: Text(
                    "Soccer",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                      message: Text("Choose your favourite player",
                  style: TextStyle(fontSize: 18),
                  ),
                  actions: <Widget>[
                  CupertinoActionSheetAction(
                  child: Text("Cristiano Ronaldo"),
                  isDefaultAction: true,
                  onPressed: () {

                  },
                  ),
                  CupertinoActionSheetAction(
                  child: Text("Lionel Messi"),
                  isDestructiveAction: true,
                  onPressed: () {

                  },
                  )
                  ],
                  cancelButton: CupertinoActionSheetAction(
                  child: Text("Cancel"),
                  onPressed: () {
                  Navigator.pop(context);
                  },
                  ),
                  );

                  showCupertinoModalPopup(context: context, builder: (context) => action);
                },
                child: Text("Book now", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
    ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
