import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grabage/constant.dart';

PreferredSizeWidget buildAppbar(context) {
  return AppBar(
    foregroundColor: titleColor,
    backgroundColor: green,
    title: const Center(
        child: Text(
      'Grabage',
      style: TextStyle(
          color: greenwhite, fontSize: 16.0, fontWeight: FontWeight.bold),
    )),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.logout),
        tooltip: 'Log Out',
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.popUntil(context, ModalRoute.withName("/"));
        },
      ),
    ],
  );
}
