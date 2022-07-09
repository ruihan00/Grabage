import 'package:flutter/material.dart';

class BeanUser {
  final String uid;
  final String name;
  final String email;

  BeanUser({
    required this.uid,
    required this.name,
    required this.email,
  });

  factory BeanUser.fromJSON(Map<String, dynamic> _json) {
    return BeanUser(
      uid: _json["uid"],
      name: _json["name"],
      email: _json["email"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "name": name,
    };
  }
}
