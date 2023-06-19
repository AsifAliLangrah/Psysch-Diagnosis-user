 import 'dart:async';
 import 'package:flutter/material.dart';
 import 'package:psych_diagnosis/Home.dart';
 import 'package:firebase_auth/firebase_auth.dart';
 import 'Login.dart';
 class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);
  @override
  State<splash> createState() => _splashState();
 }
 class _splashState extends State<splash> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            () =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) =>
                    FirebaseAuth.instance.currentUser!= null?PsychHome():
                    //userState()
                    Login()
                )
            ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 630,
                alignment: Alignment.center,
                child:Image.asset("assets/images/Logo.png",
                height: 220,
                width: 244,),
              ),
              SizedBox(
                height: 25,
              ),
              CircularProgressIndicator(
                color: Color(0xff3F48CC),
              ),
            ],
          ),
        ),
      ),
    );
  }
 }
