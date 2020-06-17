import 'dart:convert';

import 'package:flutter/material.dart';
import 'Var.dart';
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
    _localFile3;
    _localFile4;
    _localFile5;
    _trainingsDirectory;
    LoadDarkModeState();
    setTrainingsValue();
    if(Variablen.Darkmode){
      Variablen.BackgroundColor = Color.fromRGBO(33, 37, 43, 1);
      Variablen.TopbarColor = Color.fromRGBO(0, 102, 0, 1);
      Variablen.Textcolor = Colors.white;
      Variablen.BlueWidget = Color.fromRGBO(0, 76, 153, 1);
      Variablen.RedWidget = Color.fromRGBO(153, 0, 0, 1);
      Variablen.ButtonColor = Color.fromRGBO(176, 176, 176, 1);
    } else {
      Variablen.BackgroundColor = Color.fromRGBO(192, 192, 192, 1);
      Variablen.TopbarColor = Colors.green;
      Variablen.Textcolor = Colors.black;
      Variablen.BlueWidget = Colors.blueAccent;
      Variablen.RedWidget = Colors.redAccent;
      Variablen.ButtonColor = Colors.white;
    }
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
            backgroundColor: Variablen.TopbarColor,
          ),
          body: Center(
            child: Container(
                color: Variablen.BackgroundColor,
                width: 500,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Variablen.BlueWidget,
                          width: 7,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Variablen.BlueWidget,
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
                              color: Variablen.ButtonColor,
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
                                    color: Variablen.ButtonColor,
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
                        color: Variablen.RedWidget,
                        width: 7,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Variablen.RedWidget,
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
                            color: Variablen.ButtonColor,
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
                                      color: Variablen.ButtonColor,
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
                                      color: Variablen.ButtonColor,
                                      onPressed: () { Navigator.pushNamed(context, '/AddPlayer'); },
                                      child: Text("Spieler hinzufügen"),),),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    width: 300,
                                    height: 25,
                                    child: RaisedButton(
                                      color: Variablen.ButtonColor,
                                      onPressed: () { Navigator.pushNamed(context, '/TraingsListen'); },
                                      child: Text("Anwesenheitslisten"),),),
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
    try {
      var directory = await getApplicationDocumentsDirectory();
      Variablen.DocumentRoot = directory.path;
      return directory.path;
    } catch (e){

    }
  }
  Future<File> get _localFile async {
    try {
      final path = await _localPath;
      if (!File('$path/data/playerlist.txt').existsSync()) {
        File('$path/data/playerlist.txt').create(recursive: true);
      }
      return File('$path/data/playerlist.txt');
    } catch (e){}
  }
  Future PlayerList() async {
    try {
      await GetGesamtTrainings();
      String data = await readPlayerList();
      var arr = data.split("\n");
      Variablen.litems = arr;
      Navigator.pushNamed(context, '/GetPlayerList');
    } catch (e){}
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
    try{
      File players = await _localFile;
      String data = await players.readAsString();
      var raw = data.split("\n");
      List<String> Names = [];
      List<bool> States = [];
      for (int i = 0; i < raw.length; i++) {
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
      } catch (e){}
  }
  Future<File> get _localFile2 async {
    try {
      final path = await _localPath;
      if (!File('$path/data/trainings.txt').existsSync()) {
        File('$path/data/trainings.txt').create(recursive: true).then((value) => {
          value.writeAsStringSync("0")
        });
      }
      return File('$path/data/trainings.txt');
    }catch(e){}
  }
  Future GetGesamtTrainings() async {
    try {
      File file = await _localFile2;
      Variablen.TrainingsGesamt = double.parse(await file.readAsString(encoding: utf8));
    } catch(e){}
  }

  Future get _localFile3 async {
    try {
      final path = await _localPath;
      if (!File('$path/data/userdata.txt').existsSync()) {
        File('$path/data/userdata.txt').create(recursive: true);
        File('$path/data/userdata.txt').writeAsString("null");
      }
      return File('$path/data/userdata.txt');
    }catch(e){}
  }
  Future get _localFile4 async {
    try {
      final path = await _localPath;
      if (!File('$path/data/backups.txt').existsSync()) {
        File('$path/data/backups.txt').create(recursive: true);
        File('$path/data/backups.txt').writeAsString("null");
      }
      return File('$path/data/backups.txt');
    }catch(e){}
  }

  Future LoadDarkModeState() async {
    try{
      File file = await _localFile5;
      String data = await file.readAsString(encoding: utf8);
      if(data == "true"){
        Variablen.Darkmode = true;
      } else {
        Variablen.Darkmode = false;
      }
      setState(() {

      });
    } catch (e){}
  }
  Future get _localFile5 async {
    final path = await _localPath;
    if(!File('$path/data/darkmode.txt').existsSync()){
      File('$path/data/darkmode.txt').create(recursive: true);
      File('$path/data/darkmode.txt').writeAsString("true");
    }
    return File('$path/data/darkmode.txt');
  }
  Future get _trainingsDirectory async {
    final path = await _localPath;
    if(!Directory('$path/data/trainings').existsSync()){
      Directory('$path/data/trainings').create(recursive: true);
    }
    return Directory('$path/data/darkmode.txt');
  }
  Future setTrainingsValue() async {
    File file = await _localFile2;
    Variablen.TrainingsGesamt = double.parse(file.readAsStringSync());
  }
}