import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/posts_provider.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostsProvider>(context);
    final posts = provider.posts;

    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.error != null
              ? Center(child: Text(provider.error!))
              : posts == null || posts.isEmpty
                  ? const Center(child: Text('Tap refresh to display post'))
                  : ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (ctx, i) {
                        final post = posts[i];
                        return ListTile(
                          title: Text(post.title),
                          subtitle: Text(post.body),
                        );
                      },
                    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.loadPosts(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
