import 'package:flutter/material.dart';
import 'package:grabage/components/sidebar.dart';
import 'package:grabage/components/appbar.dart';
import 'package:grabage/constant.dart';
import 'package:grabage/models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.beanUser}) : super(key: key);
  static const String id = 'home_screen';
  final BeanUser? beanUser;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            // child: Text('Home Page: ${widget.beanUser!.name}'),
          ),
          // drawer: buildSidebar(context),
        ),
      ),
    );
  }
}
