import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:justmiles_app/Models/ServicesModel.dart';
import 'package:justmiles_app/PlatformWidget/platform_alert_dialog.dart';
import 'package:justmiles_app/PlatformWidget/platform_exception_alert_dialog.dart';
import 'package:justmiles_app/Services/apiPath.dart';
import 'package:justmiles_app/Services/firestoreService.dart';
import 'package:justmiles_app/serviceBooked.dart';

class ServiceForm extends StatefulWidget {
  final String title;

  const ServiceForm({Key key, this.title}) : super(key: key);
  @override
  _ServiceFormState createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {

String carname,address;
DateTime pickup;

String s1,s2,s3,s4;
bool b1 = false,b2 = false,b3 = false,b4 = false;
serviceType(String servType){
  if(servType=="Mirror Service"){
    s1 = 'Windshield';
    s2 = 'Rear view Mirror';
    s3 = 'Side View Mirror';
    s4 = 'Mirror Cleaning';
  }
  else if(servType=="Onspot Service"){
    s1 = 'Tyre Problem';
    s2 = 'Engine Problem';
    s3 = 'Empty Tank';
    s4 = 'Brake Problem';
  }
  else if(servType=="Wheel Service"){
    s1 = 'Puncture or Air Service';
    s2 = 'Brake Fluid replacement';
    s3 = 'Tyre cleaning and lubrication';
    s4 = 'Wheel bearing replacement';
  }
  else if(servType=="Engine Service"){
    s1 = 'Changing Engine Oil';
    s2 = 'Replace Oil Filter';
    s3 = 'Replace Air Filter';
    s4 = 'Replace Fuel Filter';
  }
  else if(servType=="Oil Service"){
    s1 = 'Synthetic Motor Oil';
    s2 = 'Synthentic Blend Motor Oil';
    s3 = 'Conventional Motor Oil';
    s4 = 'High Mileage Motor Oil';
  }
  else if(servType=="Gas Service"){
    s1 = 'Fuel Tank Leakage';
    s2 = 'Gas Leakage';
    s3 = 'Diesel low mileage';
    s4 = 'Petrol Low mileage';
  }
  else if(servType=="Brake Service"){
    s1 = 'Shoe Replacement';
    s2 = 'Line Replacement';
    s3 = 'ABS system';
    s4 = 'Hand Brake';
  }

  setState(() {

  });
}
@override
  void initState() {
    serviceType(widget.title);
    super.initState();
  }
GlobalKey<FormState> formkey = GlobalKey<FormState>();
bool _validateAndSaveForm() {
  final form = formkey.currentState;
  if (form.validate()) {
    form.save();
    return true;
  }
  return false;
}

Future<void> _submit() async {
  if (_validateAndSaveForm()) {
    if(pickup==null)
    {
      print("A");
      return PlatformAlertDialog(title: 'Alert', content: 'Please select dates!',defaultActionText: 'Okay',).show(context);
    }
    try {
      print("Here");

      Timestamp _dateTSpickdate = Timestamp.fromDate(pickup);
      final id = DateTime.now().toIso8601String();
      final title = widget.title;
      print('car' +  widget.title);
      String finServices="";
      if(b1)
        finServices+=s1+", ";
      if(b2)
        finServices+=s2+", ";
      if(b3)
        finServices+=s3+", ";
      if(b4)
        finServices+=s4+", ";

      final ServicesModel service = ServicesModel(
          id: id,
          name: carname,
          address: address,
          pickup: _dateTSpickdate,
          type:widget.title,
        services: finServices.substring(0,finServices.length==0 ? 0 : finServices.length-2)
      );
      final _service = FirestoreService.instance;
      String uid2;
      someMethod() async {
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        final uid2 = user.uid;
        Future<void> createAppointment(ServicesModel service) async => await _service.setData(
          path: APIPath.service(uid2, service.id),
          data: service.toMap(),
        );
        await createAppointment(service);
      }
      someMethod();
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => ServiceBooked()));




    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: 'Operation failed',
        exception: e,
      ).show(context);
    }
  }
  else{
    print("Form not filled");
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        elevation: 0,
        centerTitle: true,
        title: Text(widget.title,
            style: TextStyle( color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ),
      body: Container(
          padding:
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: SingleChildScrollView(
            child: Builder(
                builder: (context) => Form(
                    key: formkey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration:
                            InputDecoration(labelText: 'Car name'),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required"),
                            ]),
                            onSaved: (val) =>
                                setState(() => carname = val),
                          ),
                          TextFormField(
                              decoration:
                              InputDecoration(labelText: 'Pickup Address'),
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Required"),
                              ]),
                              onSaved: (val) =>
                                  setState(() => address = val)),
                          Column(
                            children: [
                              SizedBox(height: 15,),
                              Text( pickup == null ? "Select" : pickup.toString().substring(0,11)),
                              RaisedButton(
                                child: Text('Pickup date'),
                                onPressed: () {
                                  showDatePicker(
                                      context: context,
                                      initialDate:  DateTime.now() ,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2028)
                                  ).then((date) {
                                    setState(() {
                                      pickup = date;
                                    });
                                  });
                                },
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                            child: Text('   Services Available',style: TextStyle(fontSize: 20,),),
                          ),
                          CheckboxListTile(
                              title: Text(s1),
                              value: b1,
                              onChanged: (val) {
                                setState(() =>
                                b1 = !b1);
                              }),
                          CheckboxListTile(
                              title: Text(s2),
                              value: b2,
                              onChanged: (val) {
                                setState(() => b2 = !b2);
                              }),
                          CheckboxListTile(
                              title:  Text(s3),
                              value: b3,
                              onChanged: (val) {
                                setState(() =>b3 = !b3);
                              }),
                          CheckboxListTile(
                              title:  Text(s4),
                              value: b4,
                              onChanged: (val) {
                                setState(() =>b4 = !b4);
                              }),
                          SizedBox(height: 30,),
                          RaisedButton(
                              onPressed: _submit,
                              child: Container(

                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                  child: Text(" Confirm ",style: TextStyle(fontSize: 17),),
                                ),
                              )
                          ),
                        ]
                    ),

                ),

            ),
          )
      )
  );
}
}