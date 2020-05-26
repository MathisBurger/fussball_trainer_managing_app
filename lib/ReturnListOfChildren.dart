import 'package:flutter/material.dart';
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
    print("sync");
      return new Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () { print("Settings Icon"); },
              )
            ],
            title: Text("Trainer Manager",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          body: new Column(
            children: <Widget>[
              new Expanded(
                  child: new ListView.builder
                    (
                      itemCount: Variablen.litems.length,
                      itemBuilder: (BuildContext ctxt, int Index) {
                        print("litems: " + Variablen.litems.toString());
                        var Data = Variablen.litems[Index];
                        if(Data == ""){
                          return null;
                        }
                        var PlayerData = Data.split("!");
                        print("PlayerData: " + PlayerData.toString());
                        String Vorname = PlayerData[0];
                        String Nachname = PlayerData[1];
                        String Trainings = PlayerData[2];
                        String Fullname = Vorname + " " + Nachname;
                        String Path = Variablen.DocumentRoot + Vorname + "!" + Nachname + ".txt";
                        File file = new File(Path);
                        return Container(
                          width: 300,
                          height: 200,
                          margin: EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            color: Colors.blue,
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
                                  color: Colors.white,
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
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
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
          )
      );
  }


}

