import 'package:flutter/material.dart';
import 'dart:io';

class Variablen {
  static List<String> litems = [];
  static String DocumentRoot = "";
  static List<String> Player_Names = [];
  static List<bool> Player_States = [];
  static double TrainingsGesamt = 0;

  //Trainings
  static File activeFile;
  static String date;

  //Darkmode
  static bool Darkmode = true;
  static Color BackgroundColor;
  static Color TopbarColor;
  static Color Textcolor;
  static Color BlueWidget;
  static Color RedWidget;
  static Color ButtonColor;
}