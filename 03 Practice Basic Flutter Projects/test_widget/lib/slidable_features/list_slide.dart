import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:test_widget/slidable_features/list_slide_provider.dart';

import 'custom_profile_tile.dart';

class ListSlide extends StatefulWidget {
  const ListSlide({super.key});

  @override
  State<ListSlide> createState() => _ListSlideState();
}

class _ListSlideState extends State<ListSlide> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListSlideProvider>(
      builder: (
        BuildContext context,
        ListSlideProvider provider,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(title: Text('List Slidable Testing')),
          body: ListView.builder(
            itemCount: provider.users.length,
            itemBuilder: (context, index) {
              return Slidable(
              key: ValueKey(provider.users[index].email),

                startActionPane: ActionPane(
                    motion: DrawerMotion(),
                    dismissible: DismissiblePane(onDismissed: (){


                        provider.Removeindex(index);



                    }),
                    children: [
                      SlidableAction(
                        onPressed: (context){
                          print('Delete clicked');
                          // Delete user from the list
                          provider.Removeindex(index);

                        },
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: (context){
                          print('Share clicked');
                          // Share user's details
                          doNothing(context);
                        },
                        backgroundColor: Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: Icons.share,
                        label: 'Share',
                      ),
                    ]
                ),
                endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        // An action can be bigger than the others.
                        flex: 2,
                        onPressed: doNothing,
                        backgroundColor: Color(0xFF7BC043),
                        foregroundColor: Colors.white,
                        icon: Icons.archive,
                        label: 'Archive',
                      ),
                      SlidableAction(
                        onPressed: doNothing,
                        backgroundColor: Color(0xFF0392CF),
                        foregroundColor: Colors.white,
                        icon: Icons.save,
                        label: 'Save',
                      ),
                    ],
                ),

                child: CustomProfileTile(
                  leading: CircleAvatar(
                    radius: 24.sp,
                    backgroundColor: Colors.blue,
                    child: Text(
                      provider.users[index].name[0],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp
                      ),
                    ),
                  ),
                  title: provider.users[index].name,
                  subtitle: provider.users[index].email,
                ),
              );
            },
          ),
        );
      },
    );
  }
  void doNothing(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Tapped!")));
  }

}
