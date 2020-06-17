import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'Var.dart';
class PlayerList extends StatefulWidget{
  @override
  _PlayerList createState() => _PlayerList();
}
class _PlayerList extends State<PlayerList> {
  final TextEditingController eCtrl = new TextEditingController();

  @override
  Widget build (BuildContext ctxt) {
      return new Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () { Navigator.pushNamed(context, '/settings'); },
              )
            ],
            title: Text("Spieler Daten",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),),
            centerTitle: true,
            backgroundColor: Variablen.TopbarColor,
          ),
          body: Container(
          color: Variablen.BackgroundColor,
          width: 500,
          child: new Column(
            children: <Widget>[
              new Expanded(
                  child: new ListView.builder
                    (
                      itemCount: Variablen.litems.length,
                      itemBuilder: (BuildContext ctxt, int Index) {
                        String Data = Variablen.litems[Index];
                        print(Data.toString());
                        if(Data == ""){
                          return Container();
                        }
                        var PlayerData = Data.split("!");
                        print("PlayerData: " + PlayerData.toString());
                        String Vorname = PlayerData[0];
                        String Nachname = PlayerData[1];
                        String Trainings = PlayerData[2];
                        double anteil = int.parse(Trainings) / Variablen.TrainingsGesamt * 100;
                        String Fullname = Vorname + " " + Nachname;
                        String Path = Variablen.DocumentRoot + "/data/" + Vorname + "!" + Nachname + ".jpg";
                        File file = new File(Path);
                        return Container(
                          width: 300,
                          height: 200,
                          margin: EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            color: Variablen.BlueWidget,
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                width: 350,
                                child: Text(Fullname,
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                                  textAlign: TextAlign.center,
                                ),
                                decoration: BoxDecoration(
                                  color: Variablen.ButtonColor,
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                                Row(
                                  children: <Widget>[
                                      Container(
                                        width: 100,
                                        height: 120,
                                        margin: EdgeInsets.only(top: 10, left: 20),
                                        child: Image.file(file),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10, top: 10),
                                        width: 240,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: Variablen.ButtonColor,
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              child: Text("Trainingsbeteiligung",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5, left: 5),
                                              child: Text("Gesamt: " + Trainings,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5, left: 5),
                                              child: Text("Anteil: " + anteil.toString() + "%",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                  ],
                                ),
                            ],
                          ),
                        );
                      }
                  )
              )
            ],
          ),
          ),
      );
  }




}

