import 'package:flutter/material.dart';

class MediaqueryTesting extends StatefulWidget {
  const MediaqueryTesting({super.key});

  @override
  State<MediaqueryTesting> createState() => _MediaqueryTestingState();
}

class _MediaqueryTestingState extends State<MediaqueryTesting> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    print("build1");
    // Use LayoutBuilder to rebuild the widget when parent constraints change
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 500;

        // Auto open/close drawer based on width
        WidgetsBinding.instance.addPostFrameCallback((_) {
          print("build2");
          if (isWide && _scaffoldKey.currentState?.isDrawerOpen == false&&(_pressed==false)) {
            _scaffoldKey.currentState?.openDrawer();
            _pressed = true;
          } else if (!isWide && _scaffoldKey.currentState?.isDrawerOpen == true) {
            Navigator.of(context).pop();
            _pressed = false;// This will close the drawer if it's open
          }
        });

        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text('Mediaquery Testing'),
            leading: (!isWide)
                ? IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){
                _scaffoldKey.currentState?.openDrawer();
                _pressed = true;
              },
            )
                : null,
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Text("User Profile"),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                  ),
                ),
                ListTile(
                  title: Text('Item 1'),
                ),
                ListTile(
                  title: Text('Item 2'),
                ),
              ],
            ),
          ),
          body: Center(
            child: Text('Width: ${constraints.maxWidth}'),
          ),
        );
      },
    );
  }
}
