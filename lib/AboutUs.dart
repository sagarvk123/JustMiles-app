import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:justmiles_app/Models/customDrawer.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("About us",
            style: TextStyle( color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ),
      drawer: CustomDrawer(currentTab: 'About',),

      body: SingleChildScrollView(
        child: Column(
    children: <Widget>[
        ConstrainedBox(
      constraints: BoxConstraints.expand(
              height: 200
          ),
          child: imageSlider(context),
        ),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "JustMiles is a car renting and servicing android based application that is used for temporarily using a car for a fee during a specified period which also includes all the car services that a user can booked for the car by himself siting wherever and whenever the user wants."
              "\n\nThe Users can also view their previously booked orders in order history tabs, and view bills of all their orders.\n\nFor any queries, users can contact us via email, mobile, or message with just a click.",
          textAlign: TextAlign.center,
          textScaleFactor: 2.5,
          style: TextStyle(fontSize: 9, color: Colors.white54),
        ),
      ),
      ],
    ),
    ),
    );
  }
}


Swiper imageSlider(context){

  return new Swiper(
    autoplay: true,
    itemBuilder: (BuildContext context, int index) {
      return new Image.asset(
        "assets/carabout.jpg",
        fit: BoxFit.fitHeight,
      );

    },
    itemCount: 10,
    viewportFraction: 0.8,
    scale: 0.9,
    );
  }
