import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:test_widget/azlistview_packages/my_suspension_bean.dart';

class AzlistTest extends StatefulWidget {
  const AzlistTest({super.key});

  @override
  State<AzlistTest> createState() => _AzlistTestState();
}

class _AzlistTestState extends State<AzlistTest> {
  final List<ISuspensionBean> _contacts =[];
  final tags = ["A", "B", "C", "D", "E", "F", "G"];

  @override
   initState()   {
    // TODO: implement initState
    super.initState();
    generateGarbageList();
  }
  void generateGarbageList()  {

    List<List<String>> a = [
      ['Alice', 'Aaron', 'Ava', 'Andrew'],   // A
      ['Bob', 'Bella', 'Benjamin', 'Brian'], // B
      ['Charlie', 'Catherine', 'Chris', 'Cindy'], // C
      ['David', 'Diana', 'Daniel', 'Daisy'], // D
      ['Ethan', 'Emma', 'Eleanor', 'Edward'], // E
      ['Frank', 'Fiona', 'Felix', 'Faith'], // F
      ['George', 'Grace', 'Gavin', 'Gloria']  // G
    ];
    for(int i =0;i<tags.length;i++)
      {
    _contacts.add(MySuspensionBean(tag: tags[i], names: a[i]));
      }
  }
  Decoration getIndexBarDecoration(Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey[300]!, width: .5));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Azlistview'),
        backgroundColor: Colors.red,
      ),
      body: AzListView(
        data:_contacts,
        itemCount: _contacts.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ...(_contacts[index] as MySuspensionBean).names.map((name) => Text(name)),
                  ],
                ),
              ),
            );
          },

          physics:BouncingScrollPhysics(),
        indexBarData: tags,
        indexHintBuilder: (context,hint)
        {
          return Container(
            alignment: Alignment.center,
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.blue[700]!.withAlpha(200),
              shape: BoxShape.circle,
            ),
            child:
            Text(hint, style: TextStyle(color: Colors.red, fontSize: 30.0)),
          );
        },
        indexBarMargin: EdgeInsets.all(10),
        indexBarOptions: IndexBarOptions(
          needRebuild: true,
          decoration: getIndexBarDecoration(Colors.grey[50]!),
          downDecoration: getIndexBarDecoration(Colors.grey[200]!),
        )


      ),
    );
  }
}
