import 'package:flutter/material.dart';
import 'package:justmiles_app/payment.dart';


import 'info.dart';

class ServiceBooked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      backgroundColor: Colors.black26,
      elevation: 0,
      centerTitle: true,
      title: Text("Booked",
          style: TextStyle( color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
    ),
    body: SingleChildScrollView(
    child: Column(
    children: <Widget>[
    SizedBox(
    height: 50,
    ),
    Text("Booking Confirmed ",
    style: TextStyle(color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold),
    textAlign: TextAlign.center),
    SizedBox(
    height: 60,
    ),
    Image.asset(
    "assets/tickmark.gif",
    width: 200,
    height: 200,
    ),
    SizedBox(height: 120),
    Text(
    " View Details In Service Booking Section",
    textAlign: TextAlign.center,
    style: TextStyle(
    height: 1.2,
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold),
    ),
    SizedBox(
    height: 80,
    ),
    RaisedButton(
    child: Text('Pay Now',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25,
    )),
    onPressed: (){
    Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
    builder: (BuildContext context) => Home(),
    ),
    (route) => false,
    );
    },
    )
    ],
    ),
    ),
    );
  }
}
