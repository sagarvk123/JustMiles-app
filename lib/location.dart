import 'package:flutter/material.dart';
import 'package:justmiles_app/Models/customDrawer.dart';
import 'package:justmiles_app/service.dart';

import 'SignIn/auth.dart';
import 'SignIn/authenticate.dart';
import 'info.dart';
class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text("Address Details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      drawer: CustomDrawer(currentTab: 'Renting',),

    );
  }
}
