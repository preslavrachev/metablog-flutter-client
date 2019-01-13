import 'package:flutter/material.dart';
import 'package:metablog_reader/api.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.network(post.mediaThumbURL),
          ListTile(
            title: Text(post.title),
            subtitle: Text(post.description),
          )
        ],
      ),
    );
  }
}
