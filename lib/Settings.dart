import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fussball_trainer_managing_app/Var.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class Settings extends StatefulWidget {
  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Einstellungen",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
        backgroundColor: Variablen.TopbarColor,
      ),
      body: Container(
        color: Variablen.BackgroundColor,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text("Darkmode",
                      style: TextStyle(
                        fontSize: 20,
                        color: Variablen.Textcolor,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50),
                    child: Switch(
                      onChanged: (bool value) {
                        Variablen.Darkmode = !Variablen.Darkmode;
                        this.setState(() {
                          ChangeDarkModeState();
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
                        });
                      },
                      value: Variablen.Darkmode,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: SizedBox(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: Variablen.ButtonColor,
                  child: Text("Daten importieren"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/ImportPicturePack');
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: SizedBox(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: Variablen.ButtonColor,
                  child: Text("Daten exportieren"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/ExportPicturePack');
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: SizedBox(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: Variablen.ButtonColor,
                  child: Text("AGBs"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/AGBs');
                  },
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 450),
                child: Text("App Version: v1.0.0      ©2020 Mathis Burger",
                style: TextStyle(
                  color: Variablen.Textcolor,
                ),),
              ),
          ],
        ),
      ),
    );
  }
  Future<File> get _localFile2 async {
    final path = await _localPath;
    if(!File('$path/trainings.txt').existsSync()){
      File('$path/trainings.txt').create(recursive: true);
      File('$path/trainings.txt').writeAsString("0");
    }
    return File('$path/trainings.txt');
  }
  Future<String> get _localPath async {
    try {
      var directory = await getApplicationDocumentsDirectory();
      Variablen.DocumentRoot = directory.path;
      return directory.path;
    } catch (e) {}
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    if(!File('$path/playerlist.txt').existsSync()){
      File('$path/playerlist.txt').create(recursive: true);
    }
    return File('$path/playerlist.txt');
  }
  Future ChangeDarkModeState() async {
    try{
      File file = await _localFile5;
      String data = await file.readAsString(encoding: utf8);
      if(data == "true"){
        file.writeAsString("false");
      }else {
        file.writeAsString("true");
      }
    }catch (e){}
  }
  Future get _localFile4 async {
    final path = await _localPath;
    if(!File('$path/backups.txt').existsSync()){
      File('$path/backups.txt').create(recursive: true);
      File('$path/backups.txt').writeAsString("null");
    }
    return File('$path/backups.txt');
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