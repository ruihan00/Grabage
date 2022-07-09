import 'package:flutter/material.dart';
import 'package:grabage/constant.dart';

ClipRRect buildSidebar(context) {
  return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(50.0), bottom: Radius.circular(50.0)),
  child: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            gradient: loginBackground,
          ),
          child: Text('Wesho', style: TextStyle(fontSize: 25),),
        ),
        ListTile(
          title: const Text('Recycling History'),
          // Update the state of the app
          // ...
          // Then close the drawer
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Rewards'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('FAQ'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('About Us'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
      ],
    ),
  ),
  );
}
