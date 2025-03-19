import 'package:flutter/material.dart';
import '../models/post.dart';
import '../repositories/mock_posts_repository.dart';

class PostsProvider with ChangeNotifier {
  final _repo = MockPostsRepository();
  List<Post>? _posts;
  bool _isLoading = false;
  String? _error;

  List<Post>? get posts => _posts;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadPosts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _posts = await _repo.getPosts();
    } catch (e) {
      _error = 'Failed to load posts';
      _posts = null;
    }

    _isLoading = false;
    notifyListeners();
  }
}
