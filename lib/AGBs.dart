import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fussball_trainer_managing_app/Var.dart';

class AGBs extends StatefulWidget {
  _AGBs createState() => _AGBs();
}

class _AGBs extends State<AGBs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AGBs",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
        backgroundColor: Variablen.TopbarColor,
      ),
      body: Container(
        color: Variablen.BackgroundColor,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text("Datennutzung",
              style: TextStyle(
                fontSize: 20,
                color: Variablen.Textcolor,
                fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text("Sie lassen mit der Bestätigung der AGBs zu, dass Webservice Rathje ihre"
                  " Nutzerdaten speichert. Diese Daten dürfen jedoch nicht weiterverkauft oder veröffentlicht werden. "
                  "Die Sammlung dient ausschließlich der Nutzung einer Backup-Funktion. Bei anstößigen Benutzernamen wird der Account gesperrt. "
                  "Es ist Webservice Rathje gestattet Emails über neue Updates an sie zu versenden.",
                style: TextStyle(
                  fontSize: 15,
                  color: Variablen.Textcolor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text("Rechtliche Grunflagen",
              style: TextStyle(
                fontSize: 20,
                color: Variablen.Textcolor,
                fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text("Bei dieser App handelt es sich um ein Opensource Projekt. Jedoch dart diese App nur genutzt werden, wenn es sich bei der "
                  "Installationsdatei um die originale Datei von der offiziellen Webservice Rathje Website handelt. Außerdem muss bei der Nutzung der Fotos, "
                  "welche in der App verwendet werden, um Nutzungserlaubnis gefragt werden. Jeder Verstoß wird strafrechtlich verfolgt.",
              style: TextStyle(
                fontSize: 15,
                color: Variablen.Textcolor,
              ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text("Widerrufung",
              style: TextStyle(
                fontSize: 20,
                color: Variablen.Textcolor,
                fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text("Der Nutzer der App hat kein Widerrufungsrecht. Die Backupdaten bleiben gespeichert "
                  "bis der Kunde ein neues Backup hochlädt. Bei den Backups gelten die Voraussetzungen aus dem Abschnitt Datennutzung.",
              style: TextStyle(
                fontSize: 15,
                color: Variablen.Textcolor,
              ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text("Eigentumsvorbehalt",
              style: TextStyle(
                fontSize: 20,
                color: Variablen.Textcolor,
                fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text("Die App bleibt Eigentum von Mathis Burger. Die Vermarktungsrechte sind Webservice Rathje vorbehalten.",
              style: TextStyle(
                fontSize: 15,
                color: Variablen.Textcolor,
              ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text("Haftung",
              style: TextStyle(
                fontSize: 20,
                color: Variablen.Textcolor,
                fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text("Webservice Rathje oder Mathis Burger übernehmen keinerlei Haftung für die Software. "
                  "Da es sich um ein Opensource Porjekt handelt, ist der Code offen einsehbar und mögliche Sicherheitslücken "
                  "sind erkennbar. Somit gilt die Selbsthaftung und der Kunde ist selbst verantwortlich.",
              style: TextStyle(
                fontSize: 15,
                color: Variablen.Textcolor,
              ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text("Quellen",
              style: TextStyle(
                fontSize: 20,
                color: Variablen.Textcolor,
                fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Column(
                children: <Widget>[
                  Text("Quellcode:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Variablen.Textcolor,), textAlign: TextAlign.center,),
                  Text("https://github.com/MathisBurger/fussball_trainer_managing_app", style: TextStyle(fontSize: 15, color: Variablen.Textcolor,),textAlign: TextAlign.center,),
                  Text("Mathis Burger:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Variablen.Textcolor,), textAlign: TextAlign.center,),
                  Text("https://mathis-burger.de/", style: TextStyle(fontSize: 15, color: Variablen.Textcolor,),textAlign: TextAlign.center),
                  Text("Webservice Rathje:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Variablen.Textcolor,), textAlign: TextAlign.center,),
                  Text("https://webservice-rathje.de/", style: TextStyle(fontSize: 15, color: Variablen.Textcolor,),textAlign: TextAlign.center),
                  Text("Flutter Framework:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Variablen.Textcolor,), textAlign: TextAlign.center,),
                  Text("https://flutter.dev/", style: TextStyle(fontSize: 15, color: Variablen.Textcolor,),textAlign: TextAlign.center),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}