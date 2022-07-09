import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grabage/constant.dart';
import 'package:grabage/screens/recycling_history_page.dart';
import 'package:provider/provider.dart';

import '../models/tab_items.dart';
import '../providers/authentication_provider.dart';
import '../providers/user_page_provider.dart';
import '../screens/about_us_page.dart';
import '../screens/faq_page.dart';
import '../screens/home_page.dart';
import '../screens/rewards_page.dart';
import '../services/auth.dart';
import 'package:grabage/services/database_service.dart';

import 'actual_sidebar.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key, required this.auth})
      : super(key: key);
  final AuthBase auth;

  @override
  State<Sidebar> createState() =>
      _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  TabItem _currentTab = TabItem.home;
  late UsersPageProvider _usersPageProvider;

  void _select(TabItem tabItem) {
    setState(() {
      _currentTab = tabItem;
    });
  }

  @override
  void initState() {
    _setup();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsersPageProvider((FirebaseAuth.instance.currentUser?.uid)!),
        ),
        ChangeNotifierProvider<AuthenticationProvider>(
            create: (BuildContext context) {
              return AuthenticationProvider();
            })
      ],
      child: _buildUI(),
    );
  }


  Widget _buildUI() {
    return Builder(
      builder: (BuildContext _context) {
        _usersPageProvider = _context.watch<UsersPageProvider>();
        if (_usersPageProvider.user != null) {
          return CupertinoHomeScaffold(
            currentTab: _currentTab,
            onSelectTab: _select,
            auth: widget.auth,
            beanUser: _usersPageProvider.user,
          );
        } else {
          return Container(
            height: MediaQuery.of(context).size.height,
            child: const CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<void> _setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    _registerService();
  }

  void _registerService() {
    try {
      if (!GetIt.I.isRegistered<DatabaseService>()) {
        print("Trying to register navigator");
        GetIt.instance.registerSingleton<DatabaseService>(
          DatabaseService(),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
