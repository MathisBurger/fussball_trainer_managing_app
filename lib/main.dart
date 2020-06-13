import 'package:flutter/material.dart';
import 'package:fussball_trainer_managing_app/AGBs.dart';
import 'package:fussball_trainer_managing_app/AddTraining.dart';
import 'package:fussball_trainer_managing_app/AddingViaActionButton.dart';
import 'package:fussball_trainer_managing_app/ExportPicturePack.dart';
import 'package:fussball_trainer_managing_app/HomeScreen.dart';
import 'package:fussball_trainer_managing_app/ImportPicturePack.dart';
import 'package:fussball_trainer_managing_app/ReturnListOfChildren.dart';
import 'package:fussball_trainer_managing_app/Settings.dart';
import 'package:fussball_trainer_managing_app/TrainingsInformation.dart';
import 'package:fussball_trainer_managing_app/TrainingsList.dart';

void main() {
  runApp(MaterialApp(
  home: Home(),
  routes: {
    '/home': (context) => Home(),
    '/AddPlayer': (context) => AddingMenu(),
    '/GetPlayerList': (context) => PlayerList(),
    '/AddTraining': (context) => AddTraining(),
    '/settings': (context) => Settings(),
    '/AGBs': (context) => AGBs(),
    '/ImportPicturePack': (context) => ImportPicturePack(),
    '/ExportPicturePack': (context) => ExportPicturePack(),
    '/TraingsListen': (context) => TrainingsList(),
    '/AnwesendheitsListe': (context) => TrainingsInformation(),
  },
));
}

