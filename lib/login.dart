import 'package:flutter/material.dart';
import 'package:lms/forgot.dart';
import 'package:lms/home.dart';
import 'package:lms/signup.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mycontroller1 = TextEditingController();
  final mycontroller2 = TextEditingController();
  final String toEmail = "support@crayonandco.com";
  final String subject = "Help";
  final String body = "Name: \nIssue you faced: ";
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

                    mycontroller1.text = "";
                    mycontroller2.text = "";

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      (Route<dynamic> route) => false,
                    );
                  } catch (e) {
                    Fluttertoast.showToast(
                        msg: "error",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.redAccent,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: Text("Login"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => signupScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text("dont have accout? signup"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text("Forgot pasword"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () async {
                  final url =
                      'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';

                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                child: Text("Contact Us"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
