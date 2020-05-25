import 'dart:convert';
import 'AddingViaActionButton.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';



  List<String> GetPlayerInfo(String filename){
    String path = "spieler/datasheets/" + filename + ".txt";
    List<String> player = filename.split("!");
    List<String> UserData;
    new File(path).create(recursive: true).then((File file) => {
      UserData = file.readAsLinesSync(encoding: utf8)
    });
    return UserData;
  }
