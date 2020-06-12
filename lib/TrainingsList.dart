import 'package:flutter/material.dart';
import 'Var.dart';
class TrainingsList extends StatefulWidget{
  _TrainingsList createState() => _TrainingsList();
}
class _TrainingsList extends State<TrainingsList>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () { Navigator.pushNamed(context, '/settings'); },
          )
        ],
        title: Text("Trainer Manager",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
        backgroundColor: Variablen.TopbarColor,
      ),
      body: Center(
        child: Container(
          color: Variablen.BackgroundColor,
          width: 400,
          child: ListView.builder(itemBuilder: ),
        ),
      ),
    );
  }
  
}