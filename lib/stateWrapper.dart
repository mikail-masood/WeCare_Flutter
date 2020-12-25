import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wecare_2/authenticate/stateSelect.dart';
import 'package:wecare_2/models/user_info.dart';
import 'package:wecare_2/models/user_status.dart';
import 'package:wecare_2/nurse_screens/nurseView.dart';
import 'package:wecare_2/patient_screens/patientView.dart';

class StateWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //check if user has already chosen if nurse or client
    // show selection screen if not and main ui if they have
    final status = Provider.of<UserStatus>(context);

    if (status == null) {
      return StatusSelector();
    } else {
      status.toString() == 'nurse' ? NurseView() : PatientView();
    }
  }
}
