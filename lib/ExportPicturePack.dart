import 'dart:async';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

import 'Var.dart';

class ExportPicturePack extends StatefulWidget {
  _ExportPicturePack createState() => _ExportPicturePack();
}

class _ExportPicturePack extends State<ExportPicturePack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bilder-Pakete Exportieren",
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
            child: Text("Mit dieser Funktion können die Profilbilder der Spieler und allgemeine Daten exportiert werden."
                " Sie werden als .zip Datei gespeichert und können bei Bedarf wieder importiert werden, um die App "
                "beispielsweise auf einem weiteren Gerät nutzen zu können.",
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
                child: Text("Export"),
                onPressed: () {
                  ExportData(context);
                },
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
  Future ExportData(BuildContext context) async {
    String dir = await _localPath;
    print(dir);
    try {
      await File(dir + "/Data-Pack.zip").delete();
    } catch (e) {print(e.toString()); }
    final encoder = ZipFileEncoder();
    encoder.create(dir + "/Data-Pack.zip");
    var files = Directory(dir + "/data/").list(recursive: true);
    files.forEach((element) {
      print(element.path);
      if(element is File){
        encoder.addFile(element);
      } else if (element is Directory){
        encoder.addDirectory(element);
      }
    });
    encoder.close();
    print(encoder.zip_path);
    RenderBox box = context.findRenderObject();
    ShareExtend.share(dir + "/Data-Pack.zip", "file");
  }
  Future<String> get _localPath async {
    try {
      var directory = await getApplicationDocumentsDirectory();
      Variablen.DocumentRoot = directory.path;
      return directory.path;
    } catch (e) {}
  }
}
