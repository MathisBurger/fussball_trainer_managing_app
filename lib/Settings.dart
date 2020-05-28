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
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                children: <Widget>[
                  Container(
                  child: Text("Automatische Backups\n(Sie müssen sich registrieren)",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50),
                    child: Switch(
                      onChanged: (bool value) {
                          this.setState(() {
                            Variablen.AutoBackup = !Variablen.AutoBackup;
                          });
                      },
                      value: Variablen.AutoBackup,
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
                  child: Text("Registrieren"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
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

}