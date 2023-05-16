import 'package:flutter/material.dart';
import 'package:otp_clean_archi/main_widget.dart';
import 'package:otp_clean_archi/presentation/di/injector.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Injector(child: MainWidget()));
  }
}
