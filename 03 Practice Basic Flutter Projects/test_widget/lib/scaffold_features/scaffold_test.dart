import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      // floatingActionButton: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () {
      //         Fluttertoast.showToast(msg: 'This is message');
      //       },
      //       child: const Icon(Icons.message),
      //     ),
      //     const SizedBox(height: 10),
      //     FloatingActionButton(
      //       onPressed: () {
      //         Fluttertoast.showToast(msg: 'This is a camera');
      //       },
      //       child: const Icon(Icons.camera),
      //     ),
      //     const SizedBox(height: 10),
      //     FloatingActionButton(
      //       onPressed: () {
      //         Fluttertoast.showToast(msg: 'This is a Alarm');
      //       },
      //       child: const Icon(Icons.alarm),
      //     ),
      //   ],
      // ),
      floatingActionButton: FloatingActionButtonDemo(),

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
class FloatingActionButtonDemo extends StatefulWidget {
  @override
  _FloatingActionButtonDemoState createState() =>
      _FloatingActionButtonDemoState();
}

class _FloatingActionButtonDemoState extends State<FloatingActionButtonDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
  }

  void toggleFab() {
    setState(() {
      isExpanded = !isExpanded;
      if (isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated FAB Menu")),
      body: const Center(child: Text("Tap the FAB to see animation!")),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // FAB 1
          AnimatedOpacity(
            opacity: isExpanded ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Transform.translate(
              offset: Offset(0, isExpanded ? -10 : 0),
              child: FloatingActionButton(
                heroTag: "btn1",
                mini: true,
                onPressed: () => print("Message"),
                child: const Icon(Icons.message),
              ),
            ),
          ),

          // FAB 2
          AnimatedOpacity(
            opacity: isExpanded ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Transform.translate(
              offset: Offset(0, isExpanded ? -100 : 0),
              child: FloatingActionButton(
                heroTag: "btn2",
                mini: true,
                onPressed: () => print("Camera"),
                child: const Icon(Icons.camera),
              ),
            ),
          ),

          // FAB 3
          AnimatedOpacity(
            opacity: isExpanded ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Transform.translate(
              offset: Offset(0, isExpanded ? -200 : 0),
              child: FloatingActionButton(
                heroTag: "btn3",
                mini: true,
                onPressed: () => print("Alarm"),
                child: const Icon(Icons.alarm),
              ),
            ),
          ),

          // Main FAB
          FloatingActionButton(
            onPressed: toggleFab,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animation,
            ),
          ),
        ],
      ),
    );
  }
}