import 'dart:async';
import 'package:detail_information/UI/auth/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (auth.currentUser == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Welcome()));
      } else {
        return;
      }
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bcnn.jpg'), fit: BoxFit.fill)),
        height: 1.sh,
        width: 1.sw,
        child: Column(
          children: [
            SizedBox(
              width: .6.sw,
              height: .47.sh,
              child: Image.asset(
                'assets/images/FAMZYLogo.png',
              ),
            ),
            SizedBox(
              height: .2.sh,
              width: .7.sw,
              child: Image.asset('assets/images/welcomeTextC.png'),
            ),
            SizedBox(
              height: .08.sh,
            ),
            Container(
              width: 0.6.sw,
              height: .085.sh,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    width: 5, color: const Color.fromARGB(255, 0, 68, 2)),
              ),
              child: Center(
                child: Text(
                  'Let\'s Start The Journey',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 0, 68, 2),
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
