import 'package:flutter/material.dart';
import 'package:grabage/constant.dart';
import 'package:grabage/screens/recycling_history_page.dart';

import '../screens/about_us_page.dart';
import '../screens/faq_page.dart';
import '../screens/home_page.dart';
import '../screens/rewards_page.dart';

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
          title: const Text('Home'),
          // Update the state of the app
          // ...
          // Then close the drawer
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomePage()));
          },
        ),
        ListTile(
          title: const Text('Recycling History'),
          // Update the state of the app
          // ...
          // Then close the drawer
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const RecyclingHistoryPage()));
          },
        ),
        ListTile(
          title: const Text('Rewards'),
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const RewardsPage()));
          },
        ),
        ListTile(
          title: const Text('FAQ'),
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const FaqPage()));
          },
        ),
        ListTile(
          title: const Text('About Us'),
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const AboutUsPage()));
          },
        ),
      ],
    ),
  ),
  );
}
