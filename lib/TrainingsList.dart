import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'Var.dart';
import 'dart:io';
class TrainingsList extends StatefulWidget{
  _TrainingsList createState() => _TrainingsList();
}
class _TrainingsList extends State<TrainingsList>{
  String date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () { Navigator.pushNamed(context, '/settings'); },
          )
        ],
        title: Text("Trainingsliste",
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
            new Expanded(
            child: ListView.builder(
            itemCount: Variablen.TrainingsGesamt.round(),
            itemBuilder: (BuildContext content, int Index){
            Directory dir = Directory(Variablen.DocumentRoot + "/data/trainings/");
            var files = dir.listSync(recursive: false, followLinks: true);
            for(int i=0; i<files.length; i++){
            File file = files[i];
            var dirs = file.path.split("/");
            date = dirs[(dirs.length - 1)].split(".t")[0];
            }
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
              width: 360,
              decoration: BoxDecoration(
              color: Variablen.ButtonColor,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            child: Text(date,
            style: TextStyle(
            fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
                width: 360,
                height: 125,
                child: SizedBox(
                  child: RaisedButton(
                    color: Variablen.ButtonColor,
                    onPressed: () {
                        Variablen.activeFile = File(Variablen.DocumentRoot + "/data/trainings/" + date + ".txt");
                        Variablen.date = date;
                        Navigator.pushNamed(context, '/AnwesendheitsListe');
                    },
                    child: Text("mehr lesen",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    ),
                  ),
                ),
              ),
            ],
            ),
            );
            }
            ),
            ),
    ],
        ),
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
  Future<File> get _localFile2 async {
    try {
      final path = await _localPath;
      if (!File('$path/data/trainings.txt').existsSync()) {
        File('$path/data/trainings.txt').create(recursive: true);
        File('$path/data/trainings.txt').writeAsString("0");
      }
      return File('$path/data/trainings.txt');
    }catch(e){}
  }
  Future<int> get _Trainings async {
    File file = await _localFile2;
    return int.parse(file.readAsStringSync());
  }
}