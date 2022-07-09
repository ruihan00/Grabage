import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grabage/constant.dart';

PreferredSizeWidget buildAppbar(context) {
  return AppBar(
    foregroundColor: titleColor,
    backgroundColor: green,
    title: const Center(child: Text('Grabage')),
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
