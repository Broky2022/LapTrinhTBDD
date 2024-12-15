import 'dart:convert';

import 'package:flutter/material.dart';
import '../service/api.dart';
import '../model/post.dart';
import '../view/postdetail.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = ApiService().fetchAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add Scaffold as Material widget ancestor
      appBar: AppBar(
        title: const Text('Bài viết'),
      ),
      body: FutureBuilder<List<Post>>(
        future: futurePosts,
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
            List<Post> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    leading: Image.memory(
                      // Decode the base64 string into bytes
                      Base64Decoder().convert(posts[index].base64Image!.split(',')[1]),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    title: Text(posts[index].title!),
                    subtitle: Text(posts[index].body!),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostDetailScreen(
                                  posts[index].id!,
                                )),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Không có dữ liệu'),
            );
          }
        },
      ),
    );
  }
}
