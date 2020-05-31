import 'package:fussball_trainer_managing_app/AGBs.dart';
import 'package:fussball_trainer_managing_app/AddTraining.dart';
import 'package:fussball_trainer_managing_app/AddingViaActionButton.dart';
import 'package:flutter/material.dart';
import 'package:fussball_trainer_managing_app/HomeScreen.dart';
import 'package:fussball_trainer_managing_app/Login.dart';
import 'package:fussball_trainer_managing_app/Registrieren.dart';
import 'package:fussball_trainer_managing_app/ReturnListOfChildren.dart';
import 'package:fussball_trainer_managing_app/Settings.dart';

void main() {
  runApp(MaterialApp(
  home: Home(),
  routes: {
    '/home': (context) => Home(),
    '/AddPlayer': (context) => AddingMenu(),
    '/GetPlayerList': (context) => PlayerList(),
    '/AddTraining': (context) => AddTraining(),
    '/settings': (context) => Settings(),
    '/register': (context) => Register(),
    '/AGBs': (context) => AGBs(),
    '/Login': (context) => Login(),
  },
));
}

