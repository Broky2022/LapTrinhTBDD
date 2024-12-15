import 'package:flutter/material.dart';
import '../service/api.dart';
import '../model/post.dart';

class PostDetailScreen extends StatelessWidget {
  final int postId; // ID của bài viết

  const PostDetailScreen(this.postId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết bài viết'),
      ),
      body: FutureBuilder<Post>(
        future: ApiService().fetchPost(postId), // Lấy bài viết theo ID từ API
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Lỗi: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            Post post = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    post.body!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Không tìm thấy bài viết'),
            );
          }
        },
      ),
    );
  }
}
