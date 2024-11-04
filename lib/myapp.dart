import 'package:flutter/material.dart';
import 'home1.dart';
// import 'package:local_database/TextFormFields.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home1(),
    );
  }
}