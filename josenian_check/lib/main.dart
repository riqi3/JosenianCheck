import 'package:flutter/material.dart';
import 'package:josenian_check/providers/eventprovider.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => EventProvider(), child: const JosenianCheck()));
}

class JosenianCheck extends StatelessWidget {
  const JosenianCheck({super.key});

  // This widget is the root of your application.
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SCS Days 2023: Hackathon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const home(),
    );
  }
}
