import 'package:flutter/material.dart';
import 'package:grabage/components/sidebar.dart';
import 'package:grabage/components/appbar.dart';
import 'package:grabage/constant.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({Key? key}) : super(key: key);
  static const String id = 'about_us_screen';

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    var total_creds = 100;
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
              title: Text('Rewards')),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    child: const Image(
                      image: AssetImage('assets/images/recycling_bin.png'),
                    ),
                  ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 130,
                decoration: BoxDecoration(color: cream, border: Border.all(color: green)),
                child: Stack(
                  children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
                      child: Text("You have ", style: TextStyle(fontSize: 20))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 75.0, 20.0, 0.0),
                        child: Text(total_creds.toString() + " Grabage credits!", style: TextStyle(fontSize: 20))),
              ],
                ),
              ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(color: cream, border: Border.all(color: green)),
                    child: Stack(
                      children: [
                    Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
                      child:
                      Text("Latest Rewards", style: TextStyle(fontSize: 20))),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: const Image(
                              image: AssetImage('assets/images/voucher.png'),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(200.0, 35.0, 100.0, 0.0),
                            child: Text("5 dollar voucher", style: TextStyle(fontSize: 20))),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(200.0, 100.0, 0.0, 0.0),
                            child: Text("1200 credits", style: TextStyle(fontSize: 20))),
                      ],
                    ),
                  ),
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