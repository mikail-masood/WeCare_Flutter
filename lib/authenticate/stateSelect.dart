import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wecare_2/models/user_info.dart';
import 'package:wecare_2/services/auth.dart';

import '../wrapper.dart';

class Selector extends StatefulWidget {
  @override
  _SelectorState createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
  int userStatus;

  void _initializeNurseState() {
    setState(() {
      userStatus = 1;
      print(userStatus);
      return StreamProvider<UserStatus>.value(
        value: AuthService().status,
        child: Wrapper(),
      );
    });
  }

  void _initializePatientState() {
    setState(() {
      userStatus = 2;
      print(userStatus);
      UserStatus _createStatusObject(int userStatus) {
        return userStatus != null ? UserStatus(status: userStatus) : null;
      }

      _createStatusObject(userStatus);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Wrapper(),
          ));
    });
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
