import 'dart:async';

import 'package:flutter/material.dart';

class ListViewTest extends StatefulWidget {
  const ListViewTest({super.key});

  @override
  State<ListViewTest> createState() => _ListViewTestState();
}

class _ListViewTestState extends State<ListViewTest> {
  final _scrollController =ScrollController();
  bool _isloadingmore = false;

  List<String> _list = List.generate(20, (value){
    return "Item : $value";
  });


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isloadingmore){
        setState(() {
          _isloadingmore = true;
        });
        // Simulate loading more data
        Timer(Duration(seconds: 2), () {
          _list.addAll(List.generate(10, (value){
            return "Item : $value";
          }));
          setState(() {
            _isloadingmore = false;
          });
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Testing'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _list.length,
        itemBuilder: (context,index){
          return Card(
            shadowColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(_list[index]),
              onTap: () {
                // Handle item click here
              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}
