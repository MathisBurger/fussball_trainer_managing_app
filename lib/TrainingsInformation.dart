import 'package:flutter/material.dart';
import 'Var.dart';

class TrainingsInformation extends StatefulWidget {
  _TrainingsInformation createState() => _TrainingsInformation();
}
class _TrainingsInformation extends State<TrainingsInformation> {
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
          child: Column(
            children: <Widget>[
              Text("Anwesend:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Variablen.Textcolor
              ),
                textAlign: TextAlign.center,
              ),
              new Expanded(
                child: ListView.builder(
                    itemBuilder: (BuildContext context, int Index){
                      return Text();
                    }

                ),

              ),
            ],
          ),
        ),
      ),
    );
  }

}