import 'package:flutter/material.dart';
import 'package:lms/login.dart';
//ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';


import 'home.dart';

// ignore: camel_case_types
class signupScreen extends StatefulWidget {
  const signupScreen({Key? key}) : super(key: key);

  @override
  _signupScreenState createState() => _signupScreenState();
}

// ignore: camel_case_types
class _signupScreenState extends State<signupScreen> {
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
                "Signup Page",
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
                     await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: mycontroller1.text.trim(),
                        password: mycontroller2.text.trim());

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      ModalRoute.withName('/')
                    );
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text("SignUp"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (Route<dynamic> route)=> false,
                    );
              },
              child: Text("Already have account? signIn"),
            ),
          ],
        ),
      ),
    );
  }
}
