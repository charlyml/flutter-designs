import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[_titulos(), _botonesRedondeados()],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(55, 57, 84, 1.0),
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Color.fromRGBO(116, 117, 152, 1.0),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.bubble_chart), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), title: Container()),
        ],
      ),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ])),
    );

    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80.0),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0)
            ])),
      ),
    );

    return Stack(
      children: <Widget>[gradiente, Positioned(top: -100.0, child: cajaRosa)],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Clasify transaction',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Text('Clasify this transaction into a particulas category',
                style: TextStyle(color: Colors.white, fontSize: 18.0))
          ],
        ),
      ),
    );
  }

  Widget _botonesRedondeados() {
    return Table(
      children: [
        TableRow(children: [
          _crearBotonesRedondeados(Colors.blue, Icons.border_all, "General"),
          _crearBotonesRedondeados(Colors.purpleAccent, Icons.directions_bus, "Bus"),
        ]),
        TableRow(children: [
          _crearBotonesRedondeados(Colors.pinkAccent, Icons.shop, "Buy"),
          _crearBotonesRedondeados(Colors.orange, Icons.insert_drive_file, "File"),
        ]),
        TableRow(children: [
          _crearBotonesRedondeados(Colors.blueAccent, Icons.filter, "Entertaiment"),
          _crearBotonesRedondeados(Colors.green, Icons.cloud, "Cloud"),
        ]),
        TableRow(children: [
          _crearBotonesRedondeados(Colors.red, Icons.collections, "Photo"),
          _crearBotonesRedondeados(Colors.teal, Icons.help_outline, "Help"),
        ]),
      ],
    );
  }

  Widget _crearBotonesRedondeados(Color color, IconData icon, String text) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.70),
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 5.0),
              CircleAvatar(
                radius: 35.0,
                child: Icon(icon, color: color, size: 30.0),
              ),
              Text(text, style: TextStyle(color: color)),
              SizedBox(height: 5.0)
            ],
          ),
        ),
      ),
    );
  }
}
