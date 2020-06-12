import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fussball_trainer_managing_app/Var.dart';
import 'dart:io';

class AddTraining extends StatefulWidget{
  @override
  _AddTraining createState() => _AddTraining();
}
class _AddTraining extends State<AddTraining> {

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
        title: Text("Training hinzufügen",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
        backgroundColor: Variablen.TopbarColor,
      ),
      body: Container(
        color: Variablen.BackgroundColor,
        child: Column(
                children: <Widget>[
                  new Expanded(
                      child: ListView.builder(
                          itemCount: Variablen.Player_Names.length,
                          itemBuilder: (BuildContext ctxt, int Index) {
                            if(Variablen.Player_Names[Index] == ""){
                              return null;
                            }
                            return Container(
                                height: 35,
                                child: Row(
                                  children: <Widget>[
                                    Theme(
                                        data: ThemeData(unselectedWidgetColor: Variablen.Textcolor),
                                        child:Checkbox(
                                          activeColor: Variablen.BlueWidget,
                                          value: Variablen.Player_States[Index],
                                          onChanged: (bool value) {
                                            this.setState(() {
                                              Variablen.Player_States[Index] = value;
                                            });
                                          },
                                        )),
                                    Text(Variablen.Player_Names[Index],
                                    style: TextStyle(
                                      color: Variablen.Textcolor,
                                    ),
                                    ),
                                  ],
                                )
                            );

                          })
                  ),
                  Container(
                    child: RaisedButton(
                      color: Variablen.BlueWidget,
                      onPressed: () {
                        AddEinheit();
                      },
                      child: Text("Training hinuzfügen"),
                    ),
                  )
                ],
              ),
      )
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
  Future<File> get _localFile2 async {
    final path = await _localPath;
    if(!File('$path/trainings.txt').existsSync()){
      File('$path/trainings.txt').create(recursive: true);
    }
    return File('$path/trainings.txt');
  }
  Future AddEinheit() async {
    File file;
    String end = "";
    try {
      print("try");
      file = await _localFile;
      String data = await file.readAsString(encoding: utf8);
      var data_arr = data.split("\n");
      for (int i = 0; i < data_arr.length; i++) {
        if (data_arr[i] != "" && Variablen.Player_States[i] == true) {
          var raw_arr = data_arr[i].split("!");
          raw_arr[2] = (int.parse(raw_arr[2]) + 1).toString();
          end = end + raw_arr[0] + "!" + raw_arr[1] + "!" + raw_arr[2] + "\n";
        } else if (data_arr[i] == ""){}
        else {
          end = end + data_arr[i] + "\n";
        }
      }
      print("end: " + end);
      file.writeAsString(end);
      File file2 = await _localFile2;
      print("first");
      String data1 = await file2.readAsString(encoding: utf8);
      print("secound");
      print("Data" + data1);
      int val = int.parse(data1) + 1;
      print(val);
      print(val.toString());
      file2.writeAsString(val.toString());
    } catch(e) {
      print(e.toString());
    }
  }

}
