import 'package:flutter/material.dart';
import 'add_birthday_page.dart';
import 'edit_birthday_page.dart';
import '../models/birthday_model.dart';
import '../widgets/birthday_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  List<Birthday> birthdays = [];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void _addBirthday(String name, String date) {
    setState(() {
      birthdays.add(Birthday(name: name, date: date));
    });
    _controller.forward(from: 0.0); 
  }

  void _editBirthday(int index, String name, String date) {
    setState(() {
      birthdays[index] = Birthday(name: name, date: date);
    });
  }

  void _deleteBirthday(int index) {
    setState(() {
      birthdays.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              title: const Text(
                'Birthday Reminder',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    // Implement search functionality
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: birthdays.length,
                itemBuilder: (context, index) {
                  return BirthdayCard(
                    birthday: birthdays[index],
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditBirthdayPage(
                            index: index,
                            name: birthdays[index].name,
                            date: birthdays[index].date,
                            onSave: _editBirthday,
                          ),
                        ),
                      );
                    },
                    onDelete: () {
                      _deleteBirthday(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBirthdayPage(onSave: _addBirthday),
            ),
          );
        },
        child: Icon(Icons.add, size: 30),
        backgroundColor: Colors.blue, 
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}