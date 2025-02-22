import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_widget/api_features/providers/comments_provider.dart';
import 'package:test_widget/api_features/widgets/commentcard.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CommentsProvider>(context,listen: false).loadComments();
  }
  @override
  Widget build(BuildContext context) {
    final commentsProvider = Provider.of<CommentsProvider>(context);
    final list = commentsProvider.listOfComments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),

      ),
      body:Center(
        child: (list==null)?CircularProgressIndicator() : ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,index){
            return CommentCard(commentId: list[index].postId.toString(), name: list[index].name.toString(), email: list[index].email.toString(), comment: list[index].body.toString());
          },
        ),
      ),
    );
  }
}
