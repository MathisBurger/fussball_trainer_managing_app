import 'package:fussball_trainer_managing_app/AddingViaActionButton.dart';


import 'package:flutter/material.dart';
import 'package:fussball_trainer_managing_app/HomeScreen.dart';
import 'package:fussball_trainer_managing_app/ReturnListOfChildren.dart';

void main() => runApp(MaterialApp(
  home: Home(),
  routes: {
    '/home': (context) => Home(),
    '/AddPlayer': (context) => AddingMenu(),
    '/GetPlayerList': (context) => PlayerList(),
  },
));

