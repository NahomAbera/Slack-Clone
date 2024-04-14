import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CreateWorkspacePage extends StatefulWidget {
  @override
  _CreateWorkspacePageState createState() => _CreateWorkspacePageState();
}

class _CreateWorkspacePageState extends State<CreateWorkspacePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _pickedImage = File(pickedImage.path);
      }
    });
  }

  void _createWorkspace(BuildContext context) async {
    String name = _nameController.text.trim();
    String description = _descriptionController.text.trim();
    if (name.isEmpty || description.isEmpty || _pickedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields and upload an image.'),
          backgroundColor: Color(0xFF4A154B),
        ),
      );
      return;
    }

    try {
      String imageUrl = '';
      if (_pickedImage != null) {
        final ref = FirebaseStorage.instance.ref().child('channel_images').child(DateTime.now().toString() + '.jpg');
        await ref.putFile(_pickedImage!);
        imageUrl = await ref.getDownloadURL();
      }

      // Add new workspace to Firestore
      await FirebaseFirestore.instance.collection('users').doc('userID').collection('channels').add({
        'name': name,
        'description': description,
        'channelPicture': imageUrl,
      });
      Navigator.pop(context);
    } catch (error) {
      print('Error creating workspace: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4A154B), 
        title: Image.asset(
          'assets/logo2.png',
          height: AppBar().preferredSize.height * 0.8,
          fit: BoxFit.contain,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(
              '     Create a new slack Workspace',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Workspace Name',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _descriptionController,
              maxLines: 5, 
              decoration: InputDecoration(
                labelText: 'Enter Workspace Description',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Add Channel Picture:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.grey[400]!,
                  ),
                ),
                child: _pickedImage != null
                    ? Image.file(
                        _pickedImage!,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.camera_alt,
                        size: 50,
                        color: Colors.grey[500],
                      ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _createWorkspace(context),
              child: Text('Create'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF4A154B), 
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
