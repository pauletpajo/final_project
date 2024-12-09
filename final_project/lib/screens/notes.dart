import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // For formatting the date

class NoteScreen extends StatefulWidget {
  final String title;

  const NoteScreen({Key? key, required this.title}) : super(key: key);

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<XFile?> _images = [];

  // In-memory list to hold notes categorized by title
  List<Map<String, dynamic>> savedNotes = [];

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _images.add(image);
      });
    }
  }

  String getFormattedDate() {
    final now = DateTime.now();
    return DateFormat("dd MMMM, yyyy - EEEE").format(now);
  }

  void _saveNote() {
    // Save the note with its title, content, and category (title of the note)
    final note = {
      'title': _titleController.text,
      'content': _textController.text,
      'date': getFormattedDate(),
      'images': _images,
    };

    setState(() {
      savedNotes.add(note); // Add the note to the saved notes list
    });

    print('Note Saved!');
    print('Title: ${_titleController.text}');
    print('Content: ${_textController.text}');
    print('Images: ${_images.length}');

    // Optionally, you can clear the text fields and images after saving
    _titleController.clear();
    _textController.clear();
    setState(() {
      _images.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFFFFFDD0), // Cream color
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getFormattedDate(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Title Field
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Title',
                        border: InputBorder.none, // No outline
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),

                    // Main Content Field
                    TextField(
                      controller: _textController,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: 'Write your note...',
                        border: InputBorder.none, // No outline
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),

                    // Image Display
                    _images.isNotEmpty
                        ? SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _images.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Image.file(
                                    File(_images[index]!.path),
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 20),

                    // Row for Save Button and Add Image Icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Add Image Icon Button
                        IconButton(
                          icon: const Icon(Icons.add_a_photo),
                          onPressed: _pickImage, // Pick an image when pressed
                          iconSize: 30,
                          color: Colors.brown,
                        ),
                        // Save Icon Button
                        IconButton(
                          icon: const Icon(Icons.save),
                          onPressed: _saveNote, // Save note when pressed
                          iconSize: 30,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
