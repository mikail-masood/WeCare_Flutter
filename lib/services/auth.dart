import 'package:wecare_2/models/user_info.dart';

class AuthService {
  UserStatus _checkUserStatus(status) {
    return status != null ? UserStatus(status: status) : null;
  }

  Stream<UserStatus> get status {
    return status;
  }
}
