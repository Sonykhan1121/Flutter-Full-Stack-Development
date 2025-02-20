import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All buttons Tests'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print('Button Pressed!');
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 16),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                backgroundColor: Colors.blue, // Correct: A Color, not a MaterialStateProperty
                foregroundColor: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                overlayColor: Colors.teal,
              ),
              child: const Text('Click Me'),
            ),

            TextButton(onPressed: (){}, child: Text("click me")),
            IconButton(onPressed: (){}, icon: Icon(Icons.add)),
            OutlinedButton(onPressed: (){}, child: Text('Click Me outline')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
        child: Icon(Icons.add_circle),
      ),
    );
  }
}