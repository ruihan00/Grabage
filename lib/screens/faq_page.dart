import 'package:flutter/material.dart';
import 'package:grabage/components/sidebar.dart';
import 'package:grabage/components/appbar.dart';
import 'package:grabage/constant.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);
  static const String id = 'about_us_screen';

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
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
              title: Text('FAQ')),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    decoration: BoxDecoration(color: cream, border: Border.all(color: green)),
                    child: Stack(
                      children: [
                        Padding(padding: const EdgeInsets.fromLTRB(10.0,10.0, 0.0, 0.0), child:Text("How To Gain Credits?", style: TextStyle(fontSize: 30))),
                        Padding(padding: const EdgeInsets.fromLTRB(10.0,70.0, 0.0, 0.0), child:Text("Just scan the QR code on the bin after recycling your items! Credits will automatically be added into your account afterwards. You can check your credits on the Rewards page.", style: TextStyle(fontSize: 15))),
                      ],
                    ),
                  ),
                  Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(color: cream, border: Border.all(color: green)),
              child: Stack(
                children: [
                  Padding(padding: const EdgeInsets.fromLTRB(10.0,10.0, 0.0, 0.0), child:Text("What is Recycling?", style: TextStyle(fontSize: 30))),
                  Padding(padding: const EdgeInsets.fromLTRB(10.0,70.0, 0.0, 0.0), child:Text("Recycling is the process of collecting and processing materials that would otherwise be thrown away as trash and turning them into new products. ", style: TextStyle(fontSize: 15))),
                ],
              ),
            ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    decoration: BoxDecoration(color: cream, border: Border.all(color: green)),
                    child: Stack(
                      children: [
                        Padding(padding: const EdgeInsets.fromLTRB(10.0,10.0, 0.0, 0.0), child:Text("Why Should I Recycle?", style: TextStyle(fontSize: 30))),
                        Padding(padding: const EdgeInsets.fromLTRB(10.0,70.0, 0.0, 0.0), child:Text("Recycling can benefit your community, the economy and the environment.", style: TextStyle(fontSize: 15))),
                        Padding(padding: const EdgeInsets.fromLTRB(10.0,140.0, 0.0, 0.0), child:Text("Recycling one ton of office paper can save the energy equivalent of consuming 322 gallons of gasoline.", style: TextStyle(fontSize: 15))),
                        Padding(padding: const EdgeInsets.fromLTRB(10.0,210.0, 0.0, 0.0), child:Text("Recycling just one ton of aluminum cans conserves more than 152 million Btu, the equivalent of 1,024 gallons of gasoline or 21 barrels of oil consumed.", style: TextStyle(fontSize: 15))),
                        Padding(padding: const EdgeInsets.fromLTRB(10.0,280.0, 0.0, 0.0), child:Text("Plastic bottles are the most recycled plastic product in the United States as of 2018, according to our most recent report. Recycling just 10 plastic bottles save enough energy to power a laptop for more than 25 hours.", style: TextStyle(fontSize: 15))),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: BoxDecoration(color: cream, border: Border.all(color: green)),
                    child: Stack(
                      children: [
                        Padding(padding: const EdgeInsets.fromLTRB(10.0,10.0, 0.0, 0.0), child:Text("How to Recycle?", style: TextStyle(fontSize: 30))),
                        Padding(padding: const EdgeInsets.fromLTRB(10.0,70.0, 0.0, 0.0), child:Text("1.	Use a bag or box to store all your recyclables", style: TextStyle(fontSize: 15))),
                        Padding(padding: const EdgeInsets.fromLTRB(10.0,140.0, 0.0, 0.0), child:Text("2.	Make sure your items are not contaminated with food or liquids", style: TextStyle(fontSize: 15))),
                        Padding(padding: const EdgeInsets.fromLTRB(10.0,210.0, 0.0, 0.0), child:Text("3.	Recycle your items!", style: TextStyle(fontSize: 15))),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(color: cream, border: Border.all(color: green)),
                    child: Stack(
                      children: [
                        Padding(padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0), child:Text("Where can I Recycle?", style: TextStyle(fontSize: 30))),
                        Padding(padding: const EdgeInsets.fromLTRB(10.0, 70.0, 0.0, 0.0), child:Text("You can recycle metal, paper, glass and plastics by depositing them into blue recycling bins placed at every block in public housing estates. If you live in public housing developments launched after 2014, you will also have a dual chute for refuse and recyclables on your floor.", style: TextStyle(fontSize: 15))),
                        Padding(padding: const EdgeInsets.fromLTRB(10.0, 200.0, 0.0, 0.0), child:Text("Recycling bins are also given to every household living in landed homes. All condominiums will also have recycling bins within their estates.", style: TextStyle(fontSize: 15))),
                      ],
                    ),
                  ),
            ],
              ),
            )
          ),
          drawer: buildSidebar(context),
        ),
      ),
    );
  }
}