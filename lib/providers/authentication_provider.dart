import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grabage/models/user_model.dart';
import 'package:grabage/services/database_service.dart';

class AuthenticationProvider extends ChangeNotifier {
  late DatabaseService _db;
  late BeanUser user;
  AuthenticationProvider() {
    _db = GetIt.instance.get<DatabaseService>();

    // _auth.signOut();
    FirebaseAuth.instance.authStateChanges().listen((_user) async {
      if (_user != null) {
        await _db.getUser(_user.uid).then((_snapshot) {
          try {
            Map<String, dynamic> _userData =
            _snapshot.data()! as Map<String, dynamic>;
            user = BeanUser.fromJSON(_userData);
          } catch (e) {
            print(e);
          }
        });
      }
    });
  }
}
