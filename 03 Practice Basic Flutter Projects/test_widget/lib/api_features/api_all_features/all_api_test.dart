import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test_widget/api_features/api_all_features/post.dart';

import 'package:test_widget/api_features/api_all_features/services.dart';

class AllApiTest extends StatefulWidget {
  const AllApiTest({super.key});

  @override
  State<AllApiTest> createState() => _AllApiTestState();
}

class _AllApiTestState extends State<AllApiTest> {
  List<Post> posts =[];
    Post? current  = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getpostfromService();
  }

  void getpostfromService() async {
    posts = (await Services.getPost());
    setState(() {

    });
    print("${posts[0].title} ${posts[0].body} ");
  }
  void create()async {
    current =await Services.createPost(Post(title: 'test1', body: 'test body1', userId: "101"));
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api test button'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          posts.isEmpty? CircularProgressIndicator() : Column(children: [
            Text(posts[0].title),
            SizedBox(height: 30,),
            Text(posts[0].body),
          ],),
          SizedBox(height: 30,),
          current == null? CircularProgressIndicator():Text("${current?.title} ${current?.body}"),

          // FutureBuilder<List<Post?>>(future: posts,
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return CircularProgressIndicator();
          //       }
          //       else if (snapshot.connectionState == ConnectionState.none) {
          //         return Container(
          //
          //         );
          //       }
          //       else if (snapshot.hasData) {
          //         return Column(
          //           children: [
          //             Text(snapshot.data![0]?.title ?? 'nothing'),
          //             SizedBox(height: 30,),
          //             Text(snapshot.data![0]?.body ?? 'nothing'),
          //           ],
          //         );
          //       }
          //       else if (snapshot.hasError) {
          //         return Text(snapshot.error.toString());
          //       }
          //      return Text('nothing at all');
          //     }),

          ElevatedButton(onPressed: create, child: Text('create')),

          ElevatedButton(onPressed: () {}, child: Text('update')),

          ElevatedButton(onPressed: () {}, child: Text('delete')),

          ElevatedButton(onPressed: getpostfromService, child: Text('get')),
        ],
      ),
    );
  }
}
