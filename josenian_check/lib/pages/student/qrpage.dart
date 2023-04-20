import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class StudentQR extends StatefulWidget {
  const StudentQR({super.key});

  @override
  State<StudentQR> createState() => _StudentQRState();
}

class _StudentQRState extends State<StudentQR> {
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: Center(
            child: QrImage(
              data: data,
              backgroundColor: Colors.white,
              size: 300.0,
            ),
          ),
    ),);
  }
}