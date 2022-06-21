//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/list_views.dart';
import 'package:flutter_application_2/views/new.dart';
import 'package:flutter_application_2/views/splash.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Splash());
  }
}

// void callDatabase() {
//   final reg = FirebaseDatabase.instance.ref();
//   final obj = reg.child('registros/1').get();
//   print(obj.value);
// }
