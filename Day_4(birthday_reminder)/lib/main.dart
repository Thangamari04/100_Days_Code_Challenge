import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(BirthdayReminderApp());
}

class BirthdayReminderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birthday Reminder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins', 
      ),
      home: HomePage(),
    );
  }
}