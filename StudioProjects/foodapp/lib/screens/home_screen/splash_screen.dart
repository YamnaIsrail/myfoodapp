
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/screens/home_screen/homescreen.dart';


class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 10), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const HomeScreen(key: null,)));
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(

            image: DecorationImage(image: AssetImage('assets/images/img5.jpeg'),fit: BoxFit.fill),
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 46.0, left: 5),
                  child: Image(image: AssetImage('assets/images/hatt.PNG')),
                ),
                Text("Food \n Flows", style: TextStyle(
                    fontSize: 45,
                    color: Color((0xffceab42)),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Lobster",
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
