import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grabage/constant.dart';

Container buildHistory(context, items, date, creds) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 150,
    decoration: BoxDecoration(
        color: cream,
      border: Border.all(color: green)
    ),
    child: Stack(
      children: [
        Padding(padding: const EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 10.0), child: Container(
          width: 100,
          height: 100,
          child: const Image(
            image: AssetImage('assets/images/logo.png'),
          ),
        ),),
        Padding(padding: const EdgeInsets.fromLTRB(150.0, 25.0, 100.0, 0.0), child: Text("Recycled " + items, style: TextStyle(fontSize: 20))),
        Padding(padding: const EdgeInsets.fromLTRB(150.0, 90.0, 0.0, 0.0), child: Text(date, style: TextStyle(fontSize: 20))),
        Padding(padding: const EdgeInsets.fromLTRB(320.0, 50.0, 0.0, 0.0), child: Text("+" + creds + " creds", style: TextStyle(fontSize: 20))),
      ],
    ),
  );
}