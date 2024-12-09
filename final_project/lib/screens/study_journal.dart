import 'package:flutter/material.dart';

class StudyJournalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Journal'),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        children: [
          // Your list of saved notes for Study Journal here
          ListTile(
            title: Text('Sample Study Note 1'),
            subtitle: Text('Description of note...'),
          ),
          // Add more notes here
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logic to add a new Study Journal note
        },
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
      ),
    );
  }
}
