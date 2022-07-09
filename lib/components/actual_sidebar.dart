import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grabage/constant.dart';
import 'package:grabage/models/tab_items.dart';
import 'package:grabage/models/user_model.dart';
import 'package:grabage/screens/home_page.dart';
import 'package:grabage/screens/recycling_history_page.dart';
import 'package:grabage/screens/rewards_page.dart';
import 'package:grabage/screens/faq_page.dart';
import 'package:grabage/screens/about_us_page.dart';
import 'package:grabage/services/auth.dart';
import 'package:grabage/services/database_service.dart';

class CupertinoHomeScaffold extends StatefulWidget {
  const CupertinoHomeScaffold({
    Key? key,
    required this.currentTab,
    required this.onSelectTab,
    required this.auth,
    required this.beanUser,
  }) : super(key: key);
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  final AuthBase auth;
  final BeanUser? beanUser;

  @override
  State<CupertinoHomeScaffold> createState() => _CupertinoHomeScaffoldState();
}

class _CupertinoHomeScaffoldState extends State<CupertinoHomeScaffold> {
  CupertinoTabController? _cupertinoTabController;
  int tabIndex = 0;

  _getCallBack() {
    setState(() {
      tabIndex = 3;
      _cupertinoTabController!.index = 3;
    });
  }

  @override
  void initState() {
    super.initState();
    _cupertinoTabController = CupertinoTabController();
  }

  Map<TabItem, WidgetBuilder> get WidgetBuilders {
    return {
      TabItem.home: (_) =>
          HomePage(
            // auth: widget.auth,
            beanUser: widget.beanUser!,
            // callBack: this._getCallBack,
          ),
      TabItem.journal: (_) => RecyclingHistoryPage(),
      TabItem.chat: (_) => RewardsPage(),
      TabItem.profile: (_) => FaqPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _cupertinoTabController,
      tabBar: CupertinoTabBar(
        currentIndex: tabIndex,
        backgroundColor: Colors.black,
        border: Border(top: BorderSide(color: Color(0xFFF9BB62))),
        height: 60,
        items: [
          _buildItem(TabItem.home),
          _buildItem(TabItem.journal),
          _buildItem(TabItem.chat),
          _buildItem(TabItem.profile),
        ],
        onTap: (index) => widget.onSelectTab(TabItem.values[index]),
      ),
      tabBuilder: (context, index) {
        final item = TabItem.values[index];
        return CupertinoTabView(
          builder: (context) => WidgetBuilders[item]!(context),
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    final itemData = TabItemData.allTabs[tabItem];
    final color = widget.currentTab == tabItem ? Colors.white : mainColor;
    return BottomNavigationBarItem(
      activeIcon: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: redBase),
        // child: SvgPicture.asset(
        //   itemData!.activeIcon,
        //   width: 10,
        //   height: 10,
        //   color: color,
        // ),
      ),
      icon: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Color(0xFFF9BB62)),
        // child: SvgPicture.asset(
        //   itemData.icon,
        //   width: 10,
        //   height: 10,
        //   color: color,
        // ),
      ),
    );


    ClipRRect buildSidebar(context) {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(50.0), bottom: Radius.circular(50.0)),
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
                      context, MaterialPageRoute(
                      builder: (_) => const HomePage(beanUser: null,)));
                },
              ),
              ListTile(
                title: const Text('Recycling History'),
                // Update the state of the app
                // ...
                // Then close the drawer
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(
                      builder: (_) => const RecyclingHistoryPage()));
                },
              ),
              ListTile(
                title: const Text('Rewards'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const RewardsPage()));
                },
              ),
              ListTile(
                title: const Text('FAQ'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const FaqPage()));
                },
              ),
              ListTile(
                title: const Text('About Us'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const AboutUsPage()));
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}
