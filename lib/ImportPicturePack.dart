import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'Var.dart';

class ImportPicturePack extends StatefulWidget{
  _ImportPicturePack createState() => _ImportPicturePack();
}

class _ImportPicturePack extends State<ImportPicturePack> {
  File _zip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bilder-Pakete Importieren",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
        backgroundColor: Variablen.TopbarColor,
      ),
      body: Container(
        color: Variablen.BackgroundColor,
        width: 500,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Text(
                "Mit der Funktion Bilder-Pakete importieren, kannst du die Bilder deiner Spieler "
                    " und die allgemeinen Daten importieren."
                    "Importiere die ZIP-Datei, welche du zuvor exportiert hast.",
                style: TextStyle(
                  fontSize: 20,
                  color: Variablen.Textcolor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: SizedBox(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: Variablen.ButtonColor,
                  child: Text("Import"),
                  onPressed: () {
                    ImportPicturePack();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future ImportPicturePack() async {
    _zip = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['zip'],
    );
    final destination = Directory(Variablen.DocumentRoot);
    try {
      FlutterArchive.unzip(zipFile: _zip, destinationDir: destination);
    } catch (e) {
      print(e);
    }
  }
  Future<String> get _localPath async {
    try {
      var directory = await getApplicationDocumentsDirectory();
      Variablen.DocumentRoot = directory.path;
      return directory.path;
    } catch (e) {}
  }
}
