import 'package:flutter/material.dart';
import 'package:grabage/components/sidebar.dart';
import 'package:grabage/components/appbar.dart';
import 'package:grabage/constant.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);
  static const String id = 'about_us_screen';

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
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
          appBar: AppBar(
              foregroundColor: titleColor,
              backgroundColor: green,
              title: Text('About Us')),
          body: const Center(
            child: Padding(padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0, 0.0), child: Text('Our hack, “Grabage” helps users to locate the nearest recycling bin or centers. After creating an account in our hack, users will find a map with icons of bins near them. Upon recycling, users will be able to gain credits, which in turn they can exchange for rewards.', style: TextStyle(fontSize: 20),)),
          ),
          drawer: buildSidebar(context),
        ),
      ),
    );
  }
}