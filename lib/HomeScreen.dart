import 'package:flutter/material.dart';
import 'package:fussball_trainer_managing_app/ReturnListOfChildren.dart';
import 'package:fussball_trainer_managing_app/Var.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    String _value = "Spieler hinzufügen";
    PlayerList();
    _localPath;
    return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () { print("Settings Icon"); },
              )
            ],
            title: Text("Trainer Manager",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          body: Center(
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/stadion.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 400,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 7,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Colors.blueAccent,
                      ),

                      height: 200,
                      width: 350,
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 30,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Text("Spieler Daten",
                              style: TextStyle(
                                fontSize: 25,

                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 17),
                              child: SizedBox(
                                  width: 300,
                                  height: 125,
                                  child: RaisedButton(
                                    onPressed: () {
                                      PlayerList();
                                      Navigator.pushNamed(context, '/GetPlayerList');
                                      },
                                    child: Text("Daten ansehen"),
                                  )
                              )
                          ),
                        ],
                      ),
                    ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.redAccent,
                        width: 7,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Colors.redAccent,
                    ),

                    height: 200,
                    width: 350,
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white,
                          ),
                          child: Text("Hinzufügen",
                            style: TextStyle(
                              fontSize: 25,

                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 17),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 0),
                                  child: SizedBox(
                                    width: 300,
                                    height: 25,
                                    child: RaisedButton(
                                      onPressed: () { print("Moin"); },
                                      child: Text("Training Hinzufügen"),),),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    width: 300,
                                    height: 25,
                                    child: RaisedButton(
                                      onPressed: () { Navigator.pushNamed(context, '/AddPlayer'); },
                                      child: Text("Spieler hinzufügen"),),),
                                ),
                              ],
                            )
                        )

                      ],
                    ),
                  ),
                  ],
                )
            ),
          ),


      );
  }
  Future<String> get _localPath async {
    var directory = await getApplicationDocumentsDirectory();
    Variablen.DocumentRoot = directory.path;
    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/playerlist.txt');
  }
  Future PlayerList() async {
    String data = await readPlayerList();
    var arr = data.split("\n");
    Variablen.litems = arr;
  }
  Future<String> readPlayerList() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0.
      return null;
    }
}
}