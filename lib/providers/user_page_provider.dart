import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grabage/models/user_model.dart';
import 'package:grabage/providers/authentication_provider.dart';
import 'package:grabage/services/database_service.dart';

class UsersPageProvider extends ChangeNotifier {
  late AuthenticationProvider _auth;

  late DatabaseService _db;
  final String userId;
  List<BeanUser>? users;
  BeanUser? user;
  late List<BeanUser> _selectedUsers;

  List<BeanUser> get selectedUsers {
    return _selectedUsers;
  }

  UsersPageProvider(this.userId) {
    _selectedUsers = [];
    _db = GetIt.instance.get<DatabaseService>();
    // getUsers();
    // getUser(uid: this.userId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getUser({String? uid}) async {
    try {
      DocumentSnapshot<Object?> _user = await _db.getUser(uid!);
      Map<String, dynamic> _data = _user.data() as Map<String, dynamic>;
      user = BeanUser.fromJSON(_data);
      notifyListeners();
    } catch (e) {
      print("Error getting users.");
      print(e);
    }
  }

// void getUsers({String? name}) async {
//   _selectedUsers = [];
//   try {
//     _database.getUsers(name: name).then(
//       (_snapshot) {
//         users = _snapshot.docs.map(
//           (_doc) {
//             Map<String, dynamic> _data = _doc.data() as Map<String, dynamic>;
//             _data["uid"] = _doc.id;
//             return BeanUser.fromJSON(_data);
//           },
//         ).toList();
//         notifyListeners();
//       },
//     );
//   } catch (e) {
//     print("Error getting users.");
//     print(e);
//   }
// }
}
