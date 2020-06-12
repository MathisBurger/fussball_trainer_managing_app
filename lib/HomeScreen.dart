import 'dart:convert';

import 'package:flutter/material.dart';
import 'Var.dart';
import 'package:fussball_trainer_managing_app/http.dart';
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
    LoadBackupState();
    LoadDarkModeState();
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
    if(Variablen.AutoBackup){
      Backup();
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
                width: 400,
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
      if (!File('$path/playerlist.txt').existsSync()) {
        File('$path/playerlist.txt').create(recursive: true);
      }
      return File('$path/playerlist.txt');
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
      if (!File('$path/trainings.txt').existsSync()) {
        File('$path/trainings.txt').create(recursive: true);
        File('$path/trainings.txt').writeAsString("0");
      }
      return File('$path/trainings.txt');
    }catch(e){}
  }
  Future GetGesamtTrainings() async {
    try {
      File file = await _localFile2;
      Variablen.TrainingsGesamt = double.parse(await file.readAsString(encoding: utf8));
    } catch(e){}
  }
  Future Backup() async {
    if(Variablen.BackupOnLoad) {
      File file1 = await _localFile;
      String data1 = await file1.readAsString(encoding: utf8);
      File file2 = await _localFile2;
      String data2 = await file2.readAsString(encoding: utf8);
      data1 = data1.replaceAll("\n", "§");
      File file3 = await _localFile3;
      String data3 = await file3.readAsString(encoding: utf8);
      if(data3 != "null"){
        var user_arr = data3.split("!");
        String request = "/UploadBackupFussballManagerApp?username=" + user_arr[0] + "&password=" + user_arr[1] + "&ID=" + user_arr[2] + "&vals=" + data1 + "&trainings=" + data2;
        CallAPI(request);
        Variablen.BackupOnLoad = false;
      }
    }
  }
  Future get _localFile3 async {
    try {
      final path = await _localPath;
      if (!File('$path/userdata.txt').existsSync()) {
        File('$path/userdata.txt').create(recursive: true);
        File('$path/userdata.txt').writeAsString("null");
      }
      return File('$path/userdata.txt');
    }catch(e){}
  }
  Future get _localFile4 async {
    try {
      final path = await _localPath;
      if (!File('$path/backups.txt').existsSync()) {
        File('$path/backups.txt').create(recursive: true);
        File('$path/backups.txt').writeAsString("null");
      }
      return File('$path/backups.txt');
    }catch(e){}
  }
  Future LoadBackupState() async {
    try{
      File file = await _localFile4;
      String data = await file.readAsString(encoding: utf8);
      if(data == "true"){
        Variablen.AutoBackup = true;
      } else {
        Variablen.AutoBackup = false;
      }
    } catch (e){}
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
    if(!File('$path/darkmode.txt').existsSync()){
      File('$path/darkmode.txt').create(recursive: true);
      File('$path/darkmode.txt').writeAsString("true");
    }
    return File('$path/darkmode.txt');
  }
}