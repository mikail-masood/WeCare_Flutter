import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wecare_2/authenticate/signIn.dart';
import 'package:wecare_2/models/user.dart';
import 'package:wecare_2/models/user_info.dart';
import 'package:wecare_2/models/user_status.dart';
import 'package:wecare_2/services/database.dart';
import 'package:wecare_2/stateWrapper.dart';

class SignInWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // check if user has previously signed in, if so, direct them to the
    // UI. If they have not previously signed in, take them to the sign in
    // page.
    final user = Provider.of<User>(context);

    if (user == null) {
      return SignIn();
    } else {
      return StreamProvider<UserStatus>.value(
        value: DatabaseService(user.uid).userInfo.map((event) => null),
        child: StateWrapper(),
      );
    }
  }
}
