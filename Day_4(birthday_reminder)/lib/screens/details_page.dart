import 'package:flutter/material.dart';
import '../models/birthday_model.dart';

class DetailsPage extends StatelessWidget {
  final Birthday birthday;

  DetailsPage({required this.birthday});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birthday Details'),
        backgroundColor: Colors.white, 
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              Text(
                'Name: ${birthday.name}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 24),
              
              Text(
                'Date: ${birthday.date}',
                style: TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  // You can add any action here, like opening a map, etc.
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800, 
                  padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Set Reminder',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
