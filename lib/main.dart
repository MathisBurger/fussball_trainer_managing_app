import 'DesignClasses.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text("Trainer Manager",
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
    body: Center(
        child: Container(
          width: 400,
          child: Column(
            children: <Widget>[
              SpielerDatenAnzeigen(),
            ],
          )
    ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () { print("Kind hinzufuegen Button"); },
      child: Text("+"),
    ),
  ),
));

