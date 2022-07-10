import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grabage/components/sidebar.dart';
import 'package:grabage/components/appbar.dart';
import 'package:grabage/constant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "../components/locations.dart" as locations;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'home_screen';


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => const PrideExperiencePage()),
          // );
        },
        child: Scaffold(
          appBar: buildAppbar(context),
          body: Container(alignment: Alignment.center, child:(Image(image: AssetImage('assets/images/bin.jpeg')))),

          drawer: buildSidebar(context),
        ),
      ),
    );
  }
}
