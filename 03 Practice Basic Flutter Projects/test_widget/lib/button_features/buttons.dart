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
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ).copyWith(
                overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.red.withOpacity(0.5); // Customize color for pressed state
                  } else if (states.contains(MaterialState.hovered)) {
                    return Colors.yellow.withOpacity(0.3); // Customize color for hovered state
                  } else if (states.contains(MaterialState.focused)) {
                    return Colors.green.withOpacity(0.4); // Customize color for focused state
                  } else if (states.contains(MaterialState.disabled)) {
                    return Colors.grey; // Customize color for disabled state
                  }
                  return Colors.transparent; // Default color
                }),
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