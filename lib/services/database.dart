import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wecare_2/models/user_info.dart';

class DatabaseService {
  final String uid;
  DatabaseService(this.uid);

  final CollectionReference userInfoCollection =
      Firestore.instance.collection('User Info');

  Future updateUserName(String name) async {
    return await userInfoCollection.document(uid).setData({
      'name': name,
    });
  }

  Future updateUserStatus(String status) async {
    return await userInfoCollection.document(uid).setData({
      'status': status,
    });
  }

  // user info list from snapshot
  List<Info> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Info(
          name: doc.data['name'] ?? '', status: doc.data['status'] ?? ',');
    }).toList();
  }

  Stream<List<Info>> get userInfo {
    return userInfoCollection.snapshots().map(_userListFromSnapshot);
  }
}
