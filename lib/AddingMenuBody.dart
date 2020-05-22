import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
Container getBody() {
  TextEditingController vorname = new TextEditingController();
  TextEditingController nachname = new TextEditingController();
  final format = DateFormat('dd-mm-yyyy');
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          child: Text("Spieler hinzufügen",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),

        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 15,
          ),
            child: TextField(
              controller: vorname,
              decoration: InputDecoration(
                hintText: "Vorname",
              ),
            )
        ),
        Container(
            margin: EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 5,
            ),
            child: TextField(
              controller: nachname,
              decoration: InputDecoration(
                hintText: "Nachname",
              ),
            )
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: SizedBox(
            width: 250,
            height: 50,
            child: RaisedButton(
              color: Colors.lightBlue,
              child: Text("Registrieren"),
              onPressed: () {  },)
          ),
        ),
      ],
    ),
  );
}
