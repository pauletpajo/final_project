import 'package:flutter/material.dart';

class TravelJournalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Journal'),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        children: [
          // Your list of saved notes for Travel Journal here
          ListTile(
            title: Text('Sample Travel Note 1'),
            subtitle: Text('Description of note...'),
          ),
          // Add more notes here
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logic to add a new Travel Journal note
        },
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
      ),
    );
  }
}
