import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<Post>> fetchPost() async {
  // TODO: Remove tis hard-coded URL
  final METABLOG_URI = 'https://metablog.in-two.com/latest?query=apache+airflow&format=json';
  final response = await http.get(METABLOG_URI);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON

    Map<String, dynamic> jsonObject = json.decode(response.body);
    List posts = jsonObject['children'];

    print(posts);

    return posts.map((it) => Post.fromJson(it)).toList();
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final String title;
  final String mediaThumbURL;
  final String description;

  Post({this.title, this.mediaThumbURL, this.description});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        title: json['title'],
        mediaThumbURL: json['mediaThumbURL'],
        description: json['description']);
  }
}
