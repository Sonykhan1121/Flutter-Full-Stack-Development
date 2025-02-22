import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_widget/api_features/providers/posts_provider.dart';
import 'package:test_widget/api_features/widgets/presentation_card.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

      Provider.of<PostsProvider>(context, listen: false).loadPosts();

  }
  @override
  Widget build(BuildContext context) {
    final postsProvider = Provider.of<PostsProvider>(context);
    final list = postsProvider.listOfPosts;
    // print(list);
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),

      ),
      body:Center(
        child: (list==null)?CircularProgressIndicator() : ListView.builder(
          itemCount: postsProvider.listOfPosts?.length,
          itemBuilder: (context,index){
            return PresentationCard(id: list![index].id.toString(), title: list![index].title.toString(), body: list![index].body.toString());
          },
        ),
      ),
    );
  }
}
