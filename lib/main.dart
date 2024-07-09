import 'package:fetch_api_with_cubit_app/fetching_api_with_api/screens/user_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cubit App',
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      //home: const CounterScreen(),
      home: const UserScreen(),
    );
  }
}
