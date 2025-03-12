import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';

import 'country_list.dart';

class AlphabetiListScrollView extends StatefulWidget {
  final List<String> items;
  const AlphabetiListScrollView({super.key,required this.items});

  @override
  State<AlphabetiListScrollView> createState() => _AlphabetiListScrollViewState();
}

class _AlphabetiListScrollViewState extends State<AlphabetiListScrollView> {
  List<CountryList> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init_list_to_Isuspension();

  }
  void init_list_to_Isuspension()
  {
    this.items = widget.items.map((value)=>CountryList(title: value,tag:value[0])).toList();
  }
  @override
  Widget build(BuildContext context) {
    return AzListView(
        data: items,
        itemCount: items.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(items[index].title),
            onTap: () {
              print('Tapped on ${items[index].title}');
            },
          );
        },
    );
  }
}
