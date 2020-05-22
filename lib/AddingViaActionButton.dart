import 'package:flutter/material.dart';
import 'package:fussball_trainer_managing_app/AddingMenuBody.dart';

class AddingMenu extends StatefulWidget{
  @override
  _AddingMenu createState() => _AddingMenu();
}
class _AddingMenu extends State<AddingMenu>{
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
      body: getBody(),
    );
  }

}