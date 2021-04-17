import 'package:flutter/material.dart';
import 'package:justmiles_app/Models/customDrawer.dart';
import 'package:justmiles_app/commonServiceForm.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

final List<String> imagesrc = [
  "assets/servicing_cardimage.jpg",
  "assets/service3.jpg",
  "assets/oilservice.jpg",
];
final List<String> offers = [
  " ON CAR SERVICES ",
  " ON ENGINE SERVICES ",
  " ON OIL SERVICES ",
];
final List<String> offersvalue = [
  " 40% OFF ",
  " 10% OFF ",
  " 50% OFF ",
];
final List<String> offercodes = [
  " Code: ABC123 ",
  " Code: DEF456 ",
  " Code: GHI789 ",
];
int imagesrcindex = 0;

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        elevation: 0,
        centerTitle: true,
        title: Text("Our Services",
            style: TextStyle( color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ),
      drawer: CustomDrawer(currentTab: 'Service',),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 2.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                        Color(0xFF2508FF),
                        Color(0xFFFF1000)
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Text("How can we help you?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.057,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueGrey[100],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Search",
                              style:
                              TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.057,
                          width: (MediaQuery.of(context).size.width - 80) / 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.orange,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.search,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imagesrc.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 40,
                              child: Card(
                                color: Colors.transparent,
                                elevation: 0,
                                child: Container(
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        imagesrc[index],
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    offersvalue[index],
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    offers[index],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    offercodes[index],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Container(
                          height: 2.5,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: <Color>[
                              Color(0xFFFF1000),
                              Color(0xFF2508FF)
                            ]),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Text("All Services  ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center),
                      Container(
                        child: Container(
                          height: 2.5,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: <Color>[
                              Color(0xFF2508FF),
                              Color(0xFFFF1000)
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                  height: 10,
                  ),
    SingleChildScrollView(
    child: Container(
    height: MediaQuery.of(context).size.height * 0.42,
    child: Container(
    child: ListView(
    scrollDirection: Axis.vertical,
    children: <Widget>[
    FittedBox(
    child: GestureDetector(
    onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ServiceForm(title: "Onspot Service",)));
    },
    child: Card(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
    ),
    elevation: 5,
    child: Row(
    children: <Widget>[
    Container(
    width: 50,
    height: 20,
    child: ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Image(
    fit: BoxFit.contain,
    alignment: Alignment.center,
    image: AssetImage('assets/onspot.png'),
    ),
    ),
    ),
    onspotservice(),
    ],
    ),
    ),
    ),
    ),
      FittedBox(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceForm(title: "Wheel Service",)));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            child: Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      image: AssetImage('assets/wheel.jpg'),
                    ),
                  ),
                ),
                wheelservice(),
              ],
            ),
          ),
        ),
      ),
      FittedBox(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceForm(title: "Engine Service",)));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            child: Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      image: AssetImage('assets/engineservice.png'),
                    ),
                  ),
                ),
                engineservice(),
              ],
            ),
          ),
        ),
      ),
      FittedBox(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceForm(title: "Oil Service",)));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            child: Row(
              children: <Widget>[
                Container(
                  width: 35,
                  height: 13,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      image: AssetImage('assets/caroil.jpg'),
                    ),
                  ),
                ),
                oilservice(),
              ],
            ),
          ),
        ),
      ),
      FittedBox(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceForm(title: "Gas Service",)));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            child: Row(
              children: <Widget>[
                Container(
                  width: 40,
                  height: 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      image: AssetImage('assets/gasservice.jpg'),
                    ),
                  ),
                ),
                gasservice(),
              ],
            ),
          ),
        ),
      ),
      FittedBox(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceForm(title: "Mirror Service",)));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            child: Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      image: AssetImage('assets/mirrorservice.jpg'),
                    ),
                  ),
                ),
                mirrorservice(),
              ],
            ),
          ),
        ),
      ),
      FittedBox(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceForm(title: "Brake Service",)));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            child: Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      image: AssetImage('assets/brakeservice.jpg'),
                    ),
                  ),
                ),
                brakeservice(),
              ],
            ),
          ),
        ),
      ),
    ],
    ),
    ),
    ),
    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget onspotservice() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            " OnSpot Service   ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
Widget wheelservice() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Wheel Service   ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
          ),
        ),
  ],
  ),
  );
}
Widget engineservice() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            " Engine Service   ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
Widget oilservice() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            " Oil Service   ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
Widget gasservice() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            " Gas Service   ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
Widget mirrorservice() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            " Mirror Service   ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
Widget brakeservice() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            " Brake Service   ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
