import 'dart:async';
import 'posts_repository.dart';
import '../models/post.dart';

class MockPostsRepository implements PostsRepository {
  @override
  Future<List<Post>> getPosts() async {
    await Future.delayed(const Duration(seconds: 5)); // simulate delay
    return [
      Post(id: 1, title: 'Mock Post 1', body: 'This is the first mock post.'),
      Post(id: 2, title: 'Mock Post 2', body: 'This is the second mock post.'),
    ];
  }
}
