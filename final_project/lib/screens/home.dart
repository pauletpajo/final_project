import 'package:final_project/screens/library.dart'; // Import the LibraryPage
import 'package:final_project/screens/notes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDD0),
      appBar: AppBar(
        title: Text(
          'Memoir App',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                // Makes the page scrollable
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Daily Journaling Section
                      Container(
                        height: 300, // Height for the container
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              207, 190, 151, 100), // Brown background color
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Welcome!",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              "Daily Journaling",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Horizontally Scrollable Cards
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  _buildJournalCard(
                                    context: context,
                                    title: "Mood Journaling",
                                    description: "Track your moods daily",
                                    icon: Icons.sentiment_satisfied_alt,
                                    color:
                                        const Color(0xFFB3E5FC), // Light Blue
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NoteScreen(
                                              title: "Mood Journaling"),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 16),
                                  _buildJournalCard(
                                    context: context,
                                    title: "Reflective Journaling",
                                    description: "Reflect on your day",
                                    icon: Icons.edit_note,
                                    color:
                                        const Color(0xFFFFCC80), // Light Orange
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NoteScreen(
                                              title: "Reflective Journaling"),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 16),
                                  _buildJournalCard(
                                    context: context,
                                    title: "Memory Journaling",
                                    description: "Capture special moments",
                                    icon: Icons.camera_alt,
                                    color:
                                        const Color(0xFFB2EBF2), // Light Teal
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NoteScreen(
                                              title: "Memory Journaling"),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Explore Emotions Section
                      Center(
                        child: _buildSectionCard(
                          title: "Study Journal",
                          subtitle: "Organize your notes",
                          color: Colors.blue.shade200,
                          height: 200,
                          width: 350,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Unlock All Section
                      Center(
                        child: _buildSectionCard(
                          title: "Travel Journal",
                          subtitle: "Capture memory",
                          color: Colors.redAccent.shade100,
                          height: 200,
                          width: 350,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Add bottom padding for scrollable content
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Fixed Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown,
        child: Padding(
          padding: const EdgeInsets.only(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(
                context,
                Icons.home,
                "Home",
                true,
                onTap: () {
                  // Stay on HomePage
                },
              ),
              _buildBottomNavItem(
                context,
                Icons.library_books,
                "Library",
                false,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LibraryPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJournalCard({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100, // Fixed height
        width: 300, // Fixed width
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 36,
              color: Colors.white,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required String subtitle,
    required Color color,
    double height = 300,
    double width = 150,
  }) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isActive, {
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
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
}
