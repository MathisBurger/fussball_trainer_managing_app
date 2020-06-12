import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fussball_trainer_managing_app/Var.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fussball_trainer_managing_app/http.dart';
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
                  child: Text("Automatische Backups\n(Sie müssen sich registrieren)",
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
                          this.setState(() {
                            Variablen.AutoBackup = !Variablen.AutoBackup;
                            ChangeBackupState();
                          });
                      },
                      value: Variablen.AutoBackup,
                    ),
                  )
                ],
              ),
            ),
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
                        this.setState(() {
                          Variablen.Darkmode = !Variablen.Darkmode;
                          ChangeDarkModeState();
                          if(Variablen.Darkmode){
                            Variablen.BackgroundColor = Color.fromRGBO(64, 64, 64, 1);
                            Variablen.TopbarColor = Color.fromRGBO(0, 102, 0, 1);
                            Variablen.Textcolor = Colors.white;
                          } else {
                            Variablen.BackgroundColor = Colors.white;
                            Variablen.TopbarColor = Colors.green;
                            Variablen.Textcolor = Colors.black;
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
                child: Text("Manuelles Backup"),
                onPressed: () {
                  Backup();
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
                  child: Text("Letzes Backup laden"),
                  onPressed: () {
                    LoadLastBackup();
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
                  child: Text("Registrieren"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
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
                  child: Text("Login"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Login');
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
                  child: Text("Bilder-Pakete importieren"),
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
                  child: Text("Bilder-Pakete exportieren"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/ExportPicturePack');
                  },
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 450),
                child: Text("App Version: v1.0.0      ©2020 Mathis Burger"),
              ),
          ],
        ),
      ),
    );
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
        print(user_arr.toString());
        String request = "/UploadBackupFussballManagerApp?username=" + user_arr[0] + "&password=" + user_arr[1] + "&ID=" + user_arr[2] + "&vals=" + data1 + "&trainings=" + data2;
        CallAPI(request);
        Variablen.BackupOnLoad = false;
      }
    }
  }
  Future get _localFile3 async {
    final path = await _localPath;
    if(!File('$path/userdata.txt').existsSync()){
      File('$path/userdata.txt').create(recursive: true);
      File('$path/userdata.txt').writeAsString("null");
    }
    return File('$path/userdata.txt');
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
  Future ChangeBackupState() async {
    try{
    File file = await _localFile4;
      String data = await file.readAsString(encoding: utf8);
      if(data == "true"){
        file.writeAsString("false");
      }else {
        file.writeAsString("true");
      }
    }catch (e){}
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
    return File('$path/backups.txt');
  }
  Future LoadLastBackup() async {
    File file1 = await _localFile3;
    String data1 = await file1.readAsString(encoding: utf8);
    if(data1 != "null"){
      var user_arr = data1.split("!");
      String request = "/LoadBackupFussballManagerApp?username=" + user_arr[0] + "&password=" + user_arr[1] + "&ID=" + user_arr[2];
      String response = await CallAPI(request);
      var response_arr = response.split("()");
      response_arr[0] = response_arr[0].replaceAll("§", "\n");
      File file2 = await _localFile;
      await file2.writeAsString(response_arr[0]);
      File file3 = await _localFile2;
      await file3.writeAsString(response_arr[1]);

    }

  }

}