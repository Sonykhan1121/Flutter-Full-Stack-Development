import 'package:flutter/material.dart';

import 'alphabetilistscrollView.dart';

class NormalAzlist extends StatefulWidget {
  const NormalAzlist({super.key});

  @override
  State<NormalAzlist> createState() => _NormalAzlistState();
}

class _NormalAzlistState extends State<NormalAzlist> {
  final items = [
    'Alice', 'Aaron', 'Ava', 'Andrew', // A
    'Bob', 'Bella', 'Benjamin', 'Brian', // B
    'Charlie', 'Catherine', 'Chris', 'Cindy', // C
    'David', 'Diana', 'Daniel', 'Daisy', // D
    'Ethan', 'Emma', 'Eleanor', 'Edward', // E
    'Frank', 'Fiona', 'Felix', 'Faith', // F
    'George', 'Grace', 'Gavin', 'Gloria', // G
    'Henry', 'Hannah', 'Harry', 'Hailey', // H
    'Ian', 'Isla', 'Isaac', 'Ivy', // I
    'Jack', 'Julia', 'James', 'Jasmine', // J
    'Kevin', 'Katherine', 'Kyle', 'Kayla', // K
    'Liam', 'Lily', 'Lucas', 'Leah', // L
    'Michael', 'Madison', 'Matthew', 'Mia', // M
    'Nathan', 'Nora', 'Noah', 'Natalie', // N
    'Oliver', 'Olivia', 'Oscar', 'Ophelia', // O
    'Peter', 'Penelope', 'Patrick', 'Paige', // P
    'Quentin', 'Quinn', 'Quincy', 'Queenie', // Q
    'Ryan', 'Rachel', 'Richard', 'Rebecca', // R
    'Samuel', 'Sophia', 'Sebastian', 'Scarlett', // S
    'Thomas', 'Taylor', 'Theodore', 'Tessa', // T
    'Umar', 'Uma', 'Ulysses', 'Ursula', // U
    'Victor', 'Violet', 'Vincent', 'Vanessa', // V
    'William', 'Willow', 'Wesley', 'Wendy', // W
    'Xavier', 'Xena', 'Xander', 'Xiomara', // X
    'Yusuf', 'Yara', 'Yvonne', 'Yosef', // Y
    'Zachary', 'Zara', 'Zane', 'Zoey', // Z
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple List View'), centerTitle: true),
      body: AlphabetiListScrollView(items: items),
    );
  }
}
