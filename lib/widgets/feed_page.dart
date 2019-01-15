import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metablog_reader/api.dart';
import 'package:metablog_reader/widgets/post_card_widget.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Query: Apache Airflow'),
      ),
      child: FutureBuilder<List<Post>>(
        future: fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return new PostCard(post: snapshot.data[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
