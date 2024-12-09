import 'package:final_project/screens/home.dart';
import 'package:final_project/screens/notes.dart';
import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  // Define a variable to track the selected tab
  String selectedTab = "Daily Journal";

  // Define a list of library items for each tab
  List<LibraryItem> dailyJournalItems = [
    LibraryItem(
      icon: Icons.mood,
      title: 'Mood Journaling',
      description:
          'Monitor your emotions to understand how they\'re affecting you over time.',
      color: const Color(0xFFB3E5FC), // Light Blue
    ),
    LibraryItem(
      icon: Icons.mail_outline,
      title: 'Reflective Journaling',
      description:
          'Reflect on the advice you would give to yourself or write letters for your future self.',
      color: const Color(0xFFFFCC80), // Light Orange
    ),
    LibraryItem(
      icon: Icons.book,
      title: 'Memory Journaling',
      description: 'Write down three things that you are grateful for.',
      color: const Color(0xFFB2EBF2), // Light Teal
    ),
  ];

  List<LibraryItem> studyJournalItems = [
    LibraryItem(
      icon: Icons.school,
      title: 'Study Goals',
      description: 'Set and track your academic goals and progress.',
      color: const Color(0xFFE1BEE7), // Light Purple
    ),
    LibraryItem(
      icon: Icons.note,
      title: 'Lecture Notes',
      description: 'Keep track of your notes from classes or meetings.',
      color: const Color(0xFFFFF59D), // Light Yellow
    ),
  ];

  List<LibraryItem> travelJournalItems = [
    LibraryItem(
      icon: Icons.location_on,
      title: 'Travel Plans',
      description:
          'Keep a record of your upcoming travel plans and destinations.',
      color: const Color(0xFFFFCC80), // Light Orange
    ),
    LibraryItem(
      icon: Icons.camera_alt,
      title: 'Travel Memories',
      description:
          'Document your travel experiences and memories through photos and notes.',
      color: const Color(0xFFB2EBF2), // Light Teal
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<LibraryItem> selectedItems;
    if (selectedTab == "Daily Journal") {
      selectedItems = dailyJournalItems;
    } else if (selectedTab == "Study Journal") {
      selectedItems = studyJournalItems;
    } else {
      selectedItems = travelJournalItems;
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 245, 217),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Library Title Section
          Container(
            padding: const EdgeInsets.only(top: 40.0, left: 16.0, bottom: 16.0),
            decoration: const BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Library',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildTabItem(
                          "Daily Journal", selectedTab == "Daily Journal"),
                      _buildTabItem(
                          "Study Journal", selectedTab == "Study Journal"),
                      _buildTabItem(
                          "Travel Journal", selectedTab == "Travel Journal"),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Expanded Library Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: selectedItems,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown,
        child: Padding(
          padding: const EdgeInsets.only(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(Icons.home, "Home", false, context),
              _buildBottomNavItem(
                  Icons.library_books, "Library", true, context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showJournalTypeDialog(context);
        },
        backgroundColor: Colors.brown,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildTabItem(String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedTab = label; // Update the selected tab
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isActive ? const Color(0xFFD7CCC8) : const Color(0xFFF5F5F5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.black : const Color(0xFF6D4C41),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(
      IconData icon, String label, bool isActive, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (label == "Home") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive
                ? const Color.fromARGB(255, 207, 163, 147)
                : Colors.white,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  void _showJournalTypeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Journal Type'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildJournalTypeOption(context, 'Mood', Icons.mood),
              _buildJournalTypeOption(
                  context, 'Reflective', Icons.mail_outline),
              _buildJournalTypeOption(context, 'Memory', Icons.book),
            ],
          ),
        );
      },
    );
  }

  Widget _buildJournalTypeOption(
      BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoteScreen(title: title),
          ),
        );
      },
    );
  }
}

class LibraryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  LibraryItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.white, size: 40),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
