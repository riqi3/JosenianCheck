import 'package:flutter/material.dart';
import 'package:josenian_check/constants.dart';
import 'package:josenian_check/pages/professor/mainscreen.dart';
import 'package:josenian_check/pages/profile.dart';

import 'student/studentmainscreeen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MainScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Login As Professor',
                  ),
                ),
              ),
              Container(
                color: brandColor1,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StudentMainScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Login As Student',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
