import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/post.dart';

class ApiService{
  final String baseURL = 'https://my-json-server.typicode.com/Broky2022/LapTrinhTBDD/posts';

  //lấy bài viết
  Future<List<Post>> fetchAllPosts() async{
    final response = await http.get(Uri.parse(baseURL));

    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Có lỗi khi tải bài viết');
    }
  }

  //lấy 1 bài viết cụ thể
  Future<Post> fetchPost(int id) async {
    final reponse = await http.get(Uri.parse('$baseURL/$id'));

    if(reponse.statusCode == 200){
      return Post.fromJson(jsonDecode(reponse.body));
    } else {
      throw Exception('Có lỗi khi tải bài viết');
    }
  }
}