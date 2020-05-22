import 'package:flutter/material.dart';
Row begegnung(){
  return Row(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 10),
        child: Text("Heim",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 70),
        child: Text("gegen",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 70),
        child: Text("Gast",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    ],
  );
}
Row Ergebnis(){
  return Row(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 10),
        child: Text("3",
          style: TextStyle(
            fontSize: 65,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 95),
        child: Text(":",
          style: TextStyle(
            fontSize: 65,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 95),
        child: Text("0",
          style: TextStyle(
            fontSize: 65,
          ),
        ),
      ),
    ],
  );
}
Row InternerSpielberrrichtAnsehen() {
  return Row(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black87),
          borderRadius: BorderRadius.all(Radius.circular(4))
        ),
          margin: EdgeInsets.only(left: 10),
          child: SizedBox(
            width: 280,
            height: 30,
            child: RaisedButton(
              child: Text("Internen Spielberricht abrufen"),
              onPressed: () { print("Spielberricht"); },
            ),
          )
      )

    ],
  );
}