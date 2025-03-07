import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // Optional AppBar
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Added for scrollability if the content overflows
        child: Column(
          children: [
            // Profile Picture
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 60, // Adjust the size as needed
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/120'), // Replace with actual image URL

              ),
            ),

            // Menu Buttons
            ProfileMenuButton(text: 'Personal Information'),
            ProfileMenuButton(text: 'Academic Qualification'),
            ProfileMenuButton(text: 'Training Experience'),
            ProfileMenuButton(text: 'Teaching Area'),
            ProfileMenuButton(text: 'Research'),
            ProfileMenuButton(text: 'Award & Scholarship'),
            ProfileMenuButton(text: 'Previous Employment'),

            // Personal Information Card
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4, // Add a shadow
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mr. Md. Firoz Hasan  Lecturer',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      ProfileInfoRow(label: 'Name', value: 'Mr. Md. Firoz Hasan'),
                      ProfileInfoRow(label: 'Employee ID', value: '710001985'),
                      ProfileInfoRow(label: 'Designation', value: 'Lecturer'),
                      ProfileInfoRow(label: 'Department', value: 'Department of Computer Science and Engineering'),
                      ProfileInfoRow(label: 'Faculty', value: 'Faculty of Science and Information Technology'),
                      ProfileInfoRow(label: 'Personal Webpage', value: 'https://faculty.daffodilvarsity.edu.bd/prof'),
                      ProfileInfoRow(label: 'E-mail', value: 'firoz.cse@diu.edu.bd'),
                      ProfileInfoRow(label: 'Phone', value: ''), // No value in the image
                      ProfileInfoRow(label: 'Cell-Phone', value: '+8801705726026'),
                    ],
                  ),
                ),
              ),
            ),

            // Copyright Text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Copyright © 2021 Daffodil International University. All Rights Reserved & Powered by Daffodil Web Team',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper Widgets for Reusability
class ProfileMenuButton extends StatelessWidget {
  final String text;

  const ProfileMenuButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Make the button span the width
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add left/right padding
      child: ElevatedButton(
        onPressed: () {
          // Add navigation logic here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200], // Button background color
          foregroundColor: Colors.black,     // Text color
          elevation: 0,                      // Remove the shadow
          padding: EdgeInsets.symmetric(vertical: 16.0), // Vertical Padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // Make buttons rectangular
          ),
        ),
        child: Text(text),
      ),
    );
  }
}

class ProfileInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfoRow({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}