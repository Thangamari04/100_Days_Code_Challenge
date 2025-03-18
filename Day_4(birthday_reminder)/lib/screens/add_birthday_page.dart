import 'package:flutter/material.dart';

class AddBirthdayPage extends StatelessWidget {
  final Function(String name, String date) onSave;

  AddBirthdayPage({required this.onSave});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Birthday'),
        backgroundColor: Colors.white, 
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade700], 
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 16), 
                  filled: true,
                  fillColor: Colors.blue.shade100, 
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue.shade400), 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue.shade700), 
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 20),
              
              TextField(
                controller: dateController,
                decoration: InputDecoration(
                  labelText: 'Date (e.g., 01 Jan)',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 16), 
                  filled: true,
                  fillColor: Colors.blue.shade100, 
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue.shade400), 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue.shade700), 
                  ),
                ),
                style: TextStyle(color: Colors.black), 
              ),
              SizedBox(height: 30),
              
              
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    onSave(nameController.text, dateController.text);
                    Navigator.pop(context); 
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black,),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, 
                    padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 36.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), 
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
