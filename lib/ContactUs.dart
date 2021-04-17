import 'package:flutter/material.dart';
import 'package:justmiles_app/Models/customDrawer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactusPage extends StatefulWidget {
  @override
  _ContactusPageState createState() => _ContactusPageState();
}

class _ContactusPageState extends State<ContactusPage> {

  void _launchCaller (int number) async{
    var url = "tel:${number.toString()}";
    if(await canLaunch(url)){
      await launch(url);
    }
    else
    {
      throw 'Could not place call';
    }
  }

  void _launchEmail(String emailId) async{
    var url = "mailto:$emailId?subject = Ask your query";
    if(await canLaunch(url)){
      await launch(url);
    }
    else
    {
      throw 'Could not send mail';
    }
  }

  Sendsms()
  {
    String sms1="sms:7357890988";
    launch(sms1);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text("Contact Us",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: CustomDrawer(currentTab: 'Contact',),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: <Widget>[
                Text("Any Queries?",style: TextStyle(fontSize: 30,),),
                SizedBox(height: 15,),
                Text("Feel free to contact us!",style: TextStyle(fontSize: 19,),),
                SizedBox(height: 48,),
                GestureDetector(
                  onTap: () {
                    _launchEmail("sagarvk983@gmail.com");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 100,
                    width: 300,
                    alignment: Alignment.center,
                    child: Column(
                      verticalDirection: VerticalDirection.down,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.email,
                          size: 45,
                          color: Colors.greenAccent[100],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Email us",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _launchCaller(7357890988);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 100,
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.phone,
                              size: 45,
                              color: Colors.yellowAccent[100],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Call us",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellowAccent[100],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Sendsms();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 100,
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.sms,
                              size: 45,
                              color: Colors.lightBlue,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Message us",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],

        ),
      ),
    );
  }
}