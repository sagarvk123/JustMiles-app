import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:justmiles_app/Models/ServicesModel.dart';
import 'package:justmiles_app/Models/appointment.dart';
import 'package:justmiles_app/PlatformWidget/ServiceListTile.dart';
import 'package:justmiles_app/PlatformWidget/appointmentListFile.dart';
import 'package:justmiles_app/PlatformWidget/list_items_builder.dart';
import 'package:justmiles_app/PlatformWidget/platform_exception_alert_dialog.dart';
import 'package:justmiles_app/Services/database.dart';
import 'package:justmiles_app/Services/firestoreService.dart';
import 'package:justmiles_app/eachOrder.dart';


import 'Models/customDrawer.dart';
import 'Services/apiPath.dart';
class ServiceHistory extends StatefulWidget {
  @override
  _ServiceHistoryState createState() => _ServiceHistoryState();
}

class _ServiceHistoryState extends State<ServiceHistory> {
  @override
  void initState() {
    inputData();
    super.initState();
    print("init");
    setState(() {

    });
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  String uid;
  void inputData() async {
    final FirebaseUser user = await auth.currentUser();
    uid = user.uid;
    print(uid);
    setState(() {

    });
    // here you write the codes to input the data into firestore
  }

  final _service = FirestoreService.instance;
  //TODO
  Stream<List<ServicesModel>> appointmentsStream() => _service.collectionStream(
    path: APIPath.services(uid),
    builder: (data, documentId) => ServicesModel.fromMap(data, documentId),
  );
  //TODO
  @override
  Future<void> DeleteAppointment(ServicesModel appointment) async => await _service.deleteData(
      path: APIPath.service(uid, appointment.id)
  );


  Future<void> _delete(BuildContext context, ServicesModel service) async{
    try {
      await DeleteAppointment(service);
    } on PlatformException catch(e){
      PlatformExceptionAlertDialog(
        title: 'Operation Failed',
        exception: e,
      ).show(context);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Service History",
            style: TextStyle( color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ),
      drawer: CustomDrawer(currentTab: 'ServiceHistory',),

      body:  _buildContents(context),
    );


  }

  Widget _buildContents(BuildContext context) {
    return StreamBuilder<List<ServicesModel>>(
      stream: appointmentsStream(),
      builder: (context, snapshot) {
        return ListItemsBuilder<ServicesModel>(
            snapshot: snapshot,
            itemBuilder: (context, service) => Dismissible(
                key: Key('appointment-${service.id}'),
                background: Container(
                  color: Colors.red,
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) => _delete(context, service),
                child: ServiceListTile(
                  service: service,

                )
            ));

      },
    );
  }
}
