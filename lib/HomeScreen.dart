import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fussball_trainer_managing_app/ReturnListOfChildren.dart';
import 'package:fussball_trainer_managing_app/Var.dart';
import 'package:fussball_trainer_managing_app/AddTraining.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    _localPath;
    _localFile;
    _localFile2;
    return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () { Navigator.pushNamed(context, '/settings'); },
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
          body: Center(
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/stadion.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 400,
                child: Column(
                  children: <Widget>[
                    Container(
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
                                    onPressed: () {
                                      PlayerList();
                                      },
                                    child: Text("Daten ansehen"),
                                  )
                              )
                          ),
                        ],
                      ),
                    ),
                  Container(
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
                          child: Text("Hinzufügen",
                            style: TextStyle(
                              fontSize: 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 17),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 0),
                                  child: SizedBox(
                                    width: 300,
                                    height: 25,
                                    child: RaisedButton(
                                      onPressed: () {
                                        GetNameOfPlayers();
                                        },
                                      child: Text("Training Hinzufügen"),),),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    width: 300,
                                    height: 25,
                                    child: RaisedButton(
                                      onPressed: () { Navigator.pushNamed(context, '/AddPlayer'); },
                                      child: Text("Spieler hinzufügen"),),),
                                ),
                              ],
                            )
                        )

                      ],
                    ),
                  ),
                  ],
                )
            ),
          ),


      );
  }
  Future<String> get _localPath async {
    var directory = await getApplicationDocumentsDirectory();
    Variablen.DocumentRoot = directory.path;
    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    if(!File('$path/playerlist.txt').existsSync()){
      File('$path/playerlist.txt').create(recursive: true);
    }
    return File('$path/playerlist.txt');
  }
  Future PlayerList() async {
    try {
      await GetGesamtTrainings();
      String data = await readPlayerList();
      var arr = data.split("\n");
      Variablen.litems = arr;
      print(arr.toString());
      Navigator.pushNamed(context, '/GetPlayerList');
    } catch (e){
      print(e.toString());
    }
  }
  Future<String> readPlayerList() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0.
      return null;
    }
}
  Future GetNameOfPlayers() async {
    File players = await _localFile;
    String data = await players.readAsString();
      try{
      var raw = data.split("\n");
      print(raw.length);
      print(raw.toString());
      int y  = raw.length - 1;
      List<String> Names = [];
      List<bool> States = [];
      for (int i = 0; i < y; i++) {
        if(raw[i] != "") {
          var x = raw[i].split("!");
          String name = x[0] + " " + x[1];
          Names.add(name);
          States.add(false);
        }
      }
      if(Variablen.Player_Names.length != Names.length){
        Variablen.Player_Names.clear();
        Variablen.Player_Names.addAll(Names);
        Variablen.Player_States.clear();
        Variablen.Player_States.addAll(States);
      }
      Navigator.pushNamed(context, '/AddTraining');
      } catch (e){
        print(e.toString());
      }
  }
  Future<File> get _localFile2 async {
    final path = await _localPath;
    if(!File('$path/trainings.txt').existsSync()){
      File('$path/trainings.txt').create(recursive: true);
      File('$path/trainings.txt').writeAsString("0");
    }
    return File('$path/trainings.txt');
  }
  Future GetGesamtTrainings() async {
    File file = await _localFile2;
    Variablen.TrainingsGesamt = double.parse(await file.readAsString(encoding: utf8));
    print(double.parse(await file.readAsString(encoding: utf8)));
  }

}