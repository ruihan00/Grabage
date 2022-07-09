import 'package:flutter/material.dart';
import 'package:grabage/components/sidebar.dart';
import 'package:grabage/components/appbar.dart';
import 'package:grabage/constant.dart';

class RecyclingHistoryPage extends StatefulWidget {
  const RecyclingHistoryPage({Key? key}) : super(key: key);
  static const String id = 'about_us_screen';

  @override
  State<RecyclingHistoryPage> createState() => _RecyclingHistoryPageState();
}

class _RecyclingHistoryPageState extends State<RecyclingHistoryPage> {
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
          body: const Center(
            child: Text('Recycling History Page!'),
          ),
          // drawer: buildSidebar(context),
        ),
      ),
    );
  }
}