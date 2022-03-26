import 'package:app/layout/app_layout.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp( const MyApp());
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.black,
          elevation: 20.0,
        ),
      ),
      home: const Layout(),
    );
  }
}