import 'package:flutter/material.dart';
import 'package:grabage/screens/home_page.dart';
import 'package:grabage/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grabage/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyDooSUGSf63Ghq02_iIhtnmwMDs4HlWS6c',
        appId: '1:406099696497:ios:acd9c8e17b5e620e3574d0',
        messagingSenderId: '406099696497',
        projectId: 'flutterfire-e2e-tests',
        databaseURL:
        'https://flutterfire-e2e-tests-default-rtdb.europe-west1.firebasedatabase.app',
        storageBucket: 'flutterfire-e2e-tests.appspot.com',
        androidClientId:
        '406099696497-tvtvuiqogct1gs1s6lh114jeps7hpjm5.apps.googleusercontent.com',
        iosClientId:
        '406099696497-taeapvle10rf355ljcvq5dt134mkghmp.apps.googleusercontent.com',
        iosBundleId: 'io.flutter.plugins.firebase.tests',),
    );
  } else {
    Firebase.app(); // if already initialized, use that one
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grabage',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        fontFamily: 'Poppins',
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return const HomePage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}