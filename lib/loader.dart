import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Loading...",
      style: TextStyle(
        fontSize: 24.0 
        ),
      ),
      ),
    );
  }
}
