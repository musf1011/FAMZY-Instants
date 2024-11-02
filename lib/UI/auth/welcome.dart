import 'package:detail_information/UI/auth/signUp.dart';
import 'package:detail_information/UI/auth/signin/signIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

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
              height: .05.sh,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const signIn()));
              },
              child: Container(
                width: 0.6.sw,
                height: .085.sh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      width: 5, color: const Color.fromARGB(255, 0, 68, 2)),
                ),
                child: Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 0, 68, 2),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: .05.sh,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const signUp()));
              },
              child: Container(
                width: 0.6.sw,
                height: .085.sh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      width: 5, color: const Color.fromARGB(255, 0, 68, 2)),
                ),
                child: Center(
                  child: Text(
                    'Sign UP',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 0, 68, 2),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
