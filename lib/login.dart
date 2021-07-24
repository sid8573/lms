import 'package:flutter/material.dart';
import 'package:lms/home.dart';
import 'package:lms/signup.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mycontroller1 = TextEditingController();
  final mycontroller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LMS"),
         
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Login Page",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: mycontroller1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Userame",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: mycontroller2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                     await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: mycontroller1.text.trim(),
                        password: mycontroller2.text.trim());

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      (Route<dynamic> route)=> false,
                    );
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text("Login"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => signupScreen()),
                      (Route<dynamic> route)=> false,
                    );
              },
              child: Text("dont have accout? signup"),
            )
          ],
        ),
      ),
    );
  }
}
