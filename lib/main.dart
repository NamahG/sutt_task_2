import 'package:flutter/material.dart';
import 'package:sutt_task_2/loading_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sutt_task_2/post_main_screen.dart';
import 'package:sutt_task_2/traindetails.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/doubleback': (context) => Login(),
        },
      theme: ThemeData.dark(),
      home: Login(),
    );
  }
}
