import 'package:fussball_trainer_managing_app/AddingViaActionButton.dart';


import 'package:flutter/material.dart';
import 'package:fussball_trainer_managing_app/HomeScreen.dart';

void main() => runApp(MaterialApp(
  home: Home(),
  routes: {
    '/home': (context) => Home(),
    '/AddingMenu': (context) => AddingMenu(),
  },
));

