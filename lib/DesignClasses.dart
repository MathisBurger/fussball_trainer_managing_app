import 'package:flutter/material.dart';
import 'package:fussball_trainer_managing_app/letztes_spiel_container_rows.dart';
// ignore: non_constant_identifier_names
Container SpielerDatenAnzeigen(){
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blueAccent,
        width: 7,
      ),
      borderRadius: BorderRadius.all(Radius.circular(16)),
      color: Colors.blueAccent,
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
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white,
            ),
            child: Text("Spieler Daten",
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
Container LetztesSpiel(){
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.redAccent,
        width: 7,
      ),
      borderRadius: BorderRadius.all(Radius.circular(16)),
      color: Colors.redAccent,
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
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
          ),
          child: Text("Letztes Spiel",
            style: TextStyle(
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 10),
            width: 300,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          child: Column(
            children: <Widget>[
              begegnung(),
              Ergebnis(),
              InternerSpielberrrichtAnsehen(),
            ],
          ),
        ),
      ],
    ),
  );
}
