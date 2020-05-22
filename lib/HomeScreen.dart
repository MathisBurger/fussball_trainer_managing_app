import 'package:flutter/material.dart';
import 'DesignClasses.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
                    SpielerDatenAnzeigen(),
                    LetztesSpiel(),
                  ],
                )
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () { Navigator.pushNamed(context, '/AddingMenu'); },
            child: Text("+"),
          ),

      );
  }
}