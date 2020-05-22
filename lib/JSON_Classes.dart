import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'dart:io';

  CreatePlayer(String vorname, String nachname,){
    String textname = vorname + "!" + nachname + "!" + 0.toString();
    new File("spieler/playerlist.txt").create(recursive: true).then((File file) => {
      file.writeAsStringSync(textname + "\n")
    });
  }

  List<String> GetPlayerInfo(String filename){
    String path = "spieler/datasheets/" + filename + ".txt";
    List<String> player = filename.split("!");
    List<String> UserData;
    new File(path).create(recursive: true).then((File file) => {
      UserData = file.readAsLinesSync(encoding: utf8)
    });
    return UserData;
  }
