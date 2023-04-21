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
      backgroundColor: shadeBC1,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 100,
                child: Image.asset('assets/images/logo.png'),
              ),
              SizedBox(height: 50,),
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
                    style: TextStyle(color: Colors.white),
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
                    style: TextStyle(color: Colors.white,),
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
