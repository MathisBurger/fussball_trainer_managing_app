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
    var files = await dirContents(Directory(Variablen.DocumentRoot));
    final encoder = ZipFileEncoder();
    var dir = await getExternalStorageDirectory();
    files.forEach((element) {
      try {
          encoder.addFile(File(element.path));
          print(element);

      } catch (e){ print(e.toString()); }
    });
    encoder.addDirectory(Directory(Variablen.DocumentRoot + "/trainings"));
    encoder.create(Variablen.DocumentRoot + "/Data-Pack.zip");
    encoder.close();
    print(encoder.zip_path);
    RenderBox box = context.findRenderObject();
    ShareExtend.share(Variablen.DocumentRoot + "/Bilder-Pack.zip", "file");

  }
  Future<List<FileSystemEntity>> dirContents(Directory dir) {
    var files = <FileSystemEntity>[];
    var completer = Completer<List<FileSystemEntity>>();
    var lister = dir.list(recursive: false, followLinks: true);
    lister.listen (
            (file) => files.add(file),
        onDone:   () => completer.complete(files)
    );
    return completer.future;
  }
}
