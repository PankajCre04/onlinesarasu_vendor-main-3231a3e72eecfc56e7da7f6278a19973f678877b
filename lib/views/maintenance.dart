import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Sorry, We are under maintenance",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,

            ),
          ),
          SizedBox(
            height: 80,
          ),
          Image.asset('assets/images/maintenance.png'),
        ],
      ),
    );
  }
}
