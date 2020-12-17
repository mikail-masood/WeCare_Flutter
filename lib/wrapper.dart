import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authenticate/nurseLogin.dart';
import 'authenticate/patientLogin.dart';
import 'models/user_info.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<UserStatus>(context);
    print(state);
    return Container(
      color: Colors.black,
    );
  }
}
