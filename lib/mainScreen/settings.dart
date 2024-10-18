import 'package:flutter/material.dart';

class SettingProfile extends StatelessWidget {
  const SettingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/IMG-20200713-WA0003.jpg'),
              radius: 50,
            ),
          )
        ],
      ),
    );
  }
}
