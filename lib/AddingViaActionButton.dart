import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fussball_trainer_managing_app/Var.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

import 'package:path_provider/path_provider.dart';
class AddingMenu extends StatefulWidget{
  @override
  _AddingMenu createState() => _AddingMenu();
}
class _AddingMenu extends State<AddingMenu>{
  static File _image;
  static String vorname;
  static String nachname;
  final vornamecontroller = TextEditingController();
  final nachnamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Text("Spieler hinzufügen",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 15,
              ),
              child: GestureDetector(
                onTap: _getImage,
                child: Text("Moin"),

                ),
              ),
            Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                child: TextField(
                  controller: vornamecontroller,
                  decoration: InputDecoration(
                    hintText: "Vorname",
                  ),
                )
            ),
            Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 5,
                ),
                child: TextField(
                  controller: nachnamecontroller,
                  decoration: InputDecoration(
                    hintText: "Nachname",
                  ),
                )
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: SizedBox(
                  width: 250,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    child: Text("Registrieren"),
                    onPressed: () async {
                      vorname = vornamecontroller.text;
                      nachname = nachnamecontroller.text;
                      vornamecontroller.clear();
                      nachnamecontroller.clear();
                      final directory = await _localPath;
                      final String path = directory + vorname + "!" + nachname + ".txt";
                      _image.rename(path);
                      String textname = vorname + "!" + nachname + "!0\n";
                      WriteData(textname);
                    },)
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future _getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }
  Future<String> get _localPath async {
      final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/playerlist.txt');
  }
  Future<File> WriteData(String Data) async {
    final file = await _localFile;
    final String up = await file.readAsString(encoding: utf8);
    print("Datei erfolgreich geschrieben");
    String data = up + Data;
    return file.writeAsString('$data');
  }

}