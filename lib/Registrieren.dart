import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fussball_trainer_managing_app/http.dart';
import 'dart:io';
import 'package:fussball_trainer_managing_app/Var.dart';
import 'package:path_provider/path_provider.dart';


class Register extends StatefulWidget{
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  final Benutzername = TextEditingController();
  final Password = TextEditingController();
  final Email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrieren",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text("Email",
                style: TextStyle(
                    fontSize: 25
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: TextField(
                controller: Email,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
            child: Text("Benutzername (keine Sonderzeichen)",
            style: TextStyle(
              fontSize: 25
            ),
              textAlign: TextAlign.left,
            ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: TextField(
                controller: Benutzername,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text("Password",
                style: TextStyle(
                    fontSize: 25
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: TextField(
                controller: Password,
              ),
            ),
            Container(
              child: SizedBox(
                child: RaisedButton(
                  child: Text("AGBs"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/AGBs');
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: CheckboxListTile(
                title: Text("Ich akzeptiere die AGBs und möchte über Email Infos über neue Updates bekommen"),
                onChanged: (bool value) {
                  Variablen.AGBs = !Variablen.AGBs;
                  this.setState(() {

                  });
                },
                value: Variablen.AGBs,

              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: SizedBox(
                width: 300,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    RegisterAccount();
                  },
                  color: Colors.blue,
                  child: Text("Registrieren"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future RegisterAccount() async {
    try {
      String email = Email.text;
      String user = Benutzername.text;
      String pwd = Password.text;
      if (Variablen.AGBs) {
        Benutzername.clear();
        Password.clear();
        String request = "/registerFussballTrainerManagerApp?username=" + user +
            "&password=" + pwd + "&email=" + email;
        String response = await CallAPI(request);
        File file = await _localFile;
        if (await file.readAsString(encoding: utf8) != "") {
          String toWrite = user + "!" + pwd + "!" + response;
          await file.writeAsString(toWrite);
        }
      }
    } catch (e){
      print(e.toString());
    }
  }
  Future get _localFile async {
    final path = await _localPath;
    if(!File('$path/userdata.txt').existsSync()){
      File('$path/userdata.txt').create(recursive: true);
      File('$path/userdata.txt').writeAsString("null");
    }
    return File('$path/userdata.txt');
  }
  Future<String> get _localPath async {
    var directory = await getApplicationDocumentsDirectory();
    Variablen.DocumentRoot = directory.path;
    return directory.path;
  }

}