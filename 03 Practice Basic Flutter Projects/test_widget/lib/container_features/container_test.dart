import 'package:flutter/material.dart';


class ContainerTest extends StatefulWidget {
  const ContainerTest({super.key});

  @override
  State<ContainerTest> createState() => _ContainerTestState();
}

class _ContainerTestState extends State<ContainerTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Test'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
          color: Colors.amber, // Solid color background
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.green],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black,
              width: 5,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(10, 10),
              ),
            ],
          ),
          constraints: const BoxConstraints(
            minWidth: 150,
            minHeight: 100,
            maxWidth: 400, // Example of maxWidth constraint
            maxHeight: 300, // Example of maxHeight constraint
          ),
          transform: Matrix4.rotationZ(0.1), // Slight rotation
          child: const Text(
            'Hello, Container!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

