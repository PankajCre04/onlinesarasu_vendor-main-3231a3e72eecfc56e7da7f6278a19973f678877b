import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class unknownPage extends StatelessWidget {
  const unknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Sorry, Unknown Route",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,

            ),
          ),
          SizedBox(
            height: 20,
          ),
          Lottie.asset('assets/lottie/unknownRoute.json'),
        ],
      ),
    );
  }
}
