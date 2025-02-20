import 'package:flutter/material.dart';

class ScaffoldTest extends StatefulWidget {
  const ScaffoldTest({super.key});

  @override
  State<ScaffoldTest> createState() => _ScaffoldTestState();
}

class _ScaffoldTestState extends State<ScaffoldTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Full-Featured Scaffold')),
      body: SafeArea(child: Center(child: Text('Tap the button to see a SnackBar.'))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Hello from the FloatingActionButton!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('End Drawer Header'),
              decoration: BoxDecoration(color: Colors.green),
            ),
            ListTile(
              title: Text('End Item 1'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text('End Item 2'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
        ],
      ),
      persistentFooterButtons: <Widget>[
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  color: Colors.amber,
                  child: Center(child: Text('Hello from BottomSheet')),
                );
              },
            );
          },
          child: Text('Show Bottom Sheet'),
        ),
      ],
    );
  }
}
