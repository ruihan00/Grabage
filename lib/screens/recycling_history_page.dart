import 'package:flutter/material.dart';
import 'package:grabage/components/history.dart';
import 'package:grabage/components/sidebar.dart';
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
          appBar: AppBar(
              foregroundColor: titleColor,
              backgroundColor: green,
              title: Text('Recycling History')),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildHistory(context, "coke can", "6 Jul 2022", "10"),
                  buildHistory(context, "plastic bottle", "7 Jul 2022", "10"),
                  buildHistory(context, "can", "8 Jul 2022", "10"),
                  buildHistory(context, "can", "9 Jul 2022", "10"),
                  buildHistory(context, "bottle", "10 Jul 2022", "10"),
                ],
              ),
            ),
          ),
          drawer: buildSidebar(context),
        ),
      ),
    );
  }
}
