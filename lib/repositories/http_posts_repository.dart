import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';
import 'posts_repository.dart';

class HttpPostsRepository implements PostsRepository {
  @override
  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode != 200) {
      throw Exception('Failed to load posts');
    }

    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((json) => Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    )).toList();
  }
}
