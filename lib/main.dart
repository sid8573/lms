// @dart=2.9

import 'package:flutter/material.dart';
import 'package:lms/auth.dart';
import 'package:lms/home.dart';
import 'package:lms/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
      
      value: Auth().user,
      initialData: MyUser(uid: ""),
      child: MaterialApp(
        title: "LMS",
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

//  return LoginScreen();
    if (user==null) {
      return LoginScreen();
    } else {
      return Home();
    }
  }
}
