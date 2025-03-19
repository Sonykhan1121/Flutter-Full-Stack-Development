import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureBuilderTest extends StatelessWidget {
  const FutureBuilderTest({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> fetchUser() async {
      final Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load users');
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('future builder test'), centerTitle: true),
      body: FutureBuilder(
        future: fetchUser(),
        builder: (context, snapshot) {
          // Handle different states
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Loading state
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            ); // Error state
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No users found')); // Empty state
          } else {
            // Success state
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var user = snapshot.data![index];
                return ListTile(
                  leading: CircleAvatar(child: Text(user['name'][0])),
                  title: Text(user['name']),
                  subtitle: Text(user['email']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
