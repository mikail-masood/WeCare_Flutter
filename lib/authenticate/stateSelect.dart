import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wecare_2/models/user_info.dart';
import 'package:wecare_2/nurse_screens/nurseView.dart';
import 'package:wecare_2/patient_screens/patientView.dart';
import 'package:wecare_2/services/database.dart';

class StatusSelector extends StatefulWidget {
  @override
  _StatusSelectorState createState() => _StatusSelectorState();
}

class _StatusSelectorState extends State<StatusSelector> {
  String status = '';

  Future<void> _initializeNurseState() async {
    final userID = Provider.of<Info>(context, listen: false);
    setState(() {
      status = 'nurse';
    });
    await DatabaseService(userID.name.toString()).updateUserStatus(status);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NurseView(),
        ));
  }

  void _initializePatientState() async {
    final userID = Provider.of<Info>(context, listen: false);
    setState(() {
      status = 'patient';
    });
    await DatabaseService(userID.name.toString()).updateUserStatus(status);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PatientView(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Are You a',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: 18,
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: 220,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  "Patient",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              onTap: _initializePatientState,
            ),
            SizedBox(
              height: 8,
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: 220,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  "Nurse",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              onTap: _initializeNurseState,
            ),
          ],
        ),
      ),
    );
  }
}
