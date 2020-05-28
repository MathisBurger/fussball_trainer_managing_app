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
        backgroundColor: Colors.green,
      ),
      body: Center(
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
                                child: CheckboxListTile(
                                title: Text(Variablen.Player_Names[Index]),
                                value: Variablen.Player_States[Index],
                                onChanged: (bool value) {
                                  this.setState(() {
                                    Variablen.Player_States[Index] = value;
                                  });
                                },
                            ));
                          }),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.blue,
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
    for(int i=0; i<Variablen.Player_Names.length; i++){
      file = await _localFile;
      String data = await file.readAsString(encoding: utf8);
      var raw = data.split("\n");
      var name_salt = Variablen.Player_Names[i].split(" ");
      String name = name_salt[0] + "!" + name_salt[1];
      for(int x=0; x<raw.length; x++){
        if(raw[x].contains(name)){
          var arr = raw[x].split("!");
          arr[2] = (int.parse(arr[2]) + 1).toString();
          raw[x] = arr[0] + "!" + arr[1] + "!" + arr[2];
          for(int y=0; y<raw.length; y++){
            if(raw[y] != "") {
              end += raw[y] + "\n";
            }
          }
        }
      }
    }
    file.writeAsString(end);
    File file2 = await _localFile2;
    print("first");
    String data = await file2.readAsString(encoding: utf8);
    print("secound");
    print("Data" + data);
    int val = int.parse(data) + 1;
    print(val);
    print(val.toString());
    file2.writeAsString(val.toString());
  }

}
