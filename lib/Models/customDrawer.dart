import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justmiles_app/AboutUs.dart';
import 'package:justmiles_app/ContactUs.dart';
import 'package:justmiles_app/Models/appointment.dart';
import 'package:justmiles_app/Services/apiPath.dart';
import 'package:justmiles_app/Services/firestoreService.dart';
import 'package:justmiles_app/ServicesHistory.dart';
import 'package:justmiles_app/SignIn/auth.dart';
import 'package:justmiles_app/SignIn/authenticate.dart';
import 'package:justmiles_app/SignIn/signin.dart';
import 'package:justmiles_app/info.dart';
import 'package:justmiles_app/orderhistory.dart';
import 'package:justmiles_app/service.dart';


class CustomDrawer extends StatefulWidget {
  CustomDrawer({
    Key key,
    @required this.currentTab
  }) : super(key: key);

  String currentTab;


  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();

    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountEmail: Text( "${user?.email}"!=null.toString() ? "${user?.email}" : "Log in to your account"  ),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage('https://www.fedex.com/content/dam/fedex/us-united-states/shipping/images/2020/Q2/account_purple_icon_1988286190.png'),
            ),
          ),

          Container(
            decoration: new BoxDecoration (
                color: widget.currentTab == 'Renting' ? Colors.black : Colors.black12
            ),
            child: new ListTile(
              title: new Text (' Car Renting '),

              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RentPage()));
              },
            ),
          ),
          new Divider(
            color: Colors.white,
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
                color:  widget.currentTab == 'Service' ? Colors.black : Colors.black12
            ),
            child: new ListTile(
              title: new Text (' Car Service '),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ServicePage()));
              },
            ),
          ),
          new Divider(
            color: Colors.white,
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
                color:  widget.currentTab == 'History' ? Colors.black : Colors.black12
            ),
            child: new ListTile(
              title: new Text (' Bookings History '),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderHistory()));
              },
            ),
          ),
          new Divider(
            color: Colors.white,
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
                color:  widget.currentTab == 'ServiceHistory' ? Colors.black : Colors.black12
            ),
            child: new ListTile(
              title: new Text (' Service History '),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ServiceHistory()));
              },
            ),
          ),
          new Divider(
            color: Colors.white,
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
                color:  widget.currentTab == 'About' ? Colors.black : Colors.black12
            ),
            child: new ListTile(
              title: new Text (' About us '),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AboutUs()));
              },
            ),
          ),
          new Divider(
            color: Colors.white,
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
                color:  widget.currentTab == 'Contact' ? Colors.black : Colors.black12
            ),
            child: new ListTile(
              title: new Text (' Contact us '),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactusPage()));
              },
            ),
          ),

          SizedBox(height: 100,),
          GestureDetector(
            onTap: () {
              AuthMethods authMethods = new AuthMethods();
              authMethods.signOut();
              Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (context) => Authenticate()
              ),
                    (route) => false,
              );
            },
            child: Container(
              decoration: new BoxDecoration (
                  color: Colors.black26
              ),
              child: new ListTile(
                title: new Text('Logout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}