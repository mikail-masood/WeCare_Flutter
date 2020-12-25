import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wecare_2/models/user.dart';
import 'package:wecare_2/services/auth.dart';
import 'package:wecare_2/signInWrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignInWrapper(),
        ));
  }
}
