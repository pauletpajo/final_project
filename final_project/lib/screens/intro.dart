import 'package:final_project/screens/home.dart';
import 'package:flutter/material.dart';

class descScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ensure the image path is correct
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/image.jpg',
                    height: 250,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 100,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Title
              const Text(
                "Say Hello, to Your Inner Self",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8D745B),
                ),
              ),
              const SizedBox(height: 8),
              // Subtitle
              const Text(
                "Reflect on your daily experiences, track personal growth, and nurture mental well-being through mindfulness and self-reflection.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF8D745B),
                ),
              ),
              const SizedBox(height: 32),
              // Navigation Indicators (Dots)

              const SizedBox(height: 60),
              // Navigation Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8D745B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      "Next →",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
