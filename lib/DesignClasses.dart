import 'package:flutter/material.dart';
Container SpielerDatenAnzeigen(){
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blueAccent,
        width: 7,
      ),
      borderRadius: BorderRadius.all(Radius.circular(16)),
      color: Colors.blue,
    ),

    height: 200,
    width: 350,
    margin: EdgeInsets.only(top: 20),
    child: Column(
        children: <Widget>[
          Container(
            height: 30,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.white,
            ),
            child: Text("Moin",
              style: TextStyle(
                fontSize: 25,

              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 17),
            child: SizedBox(
                width: 300,
                height: 125,
                child: RaisedButton(
                  onPressed: () { print("Moin"); },
                  child: Text("Daten ansehen"),
                )
            )
          ),
        ],
    ),
  );
}
