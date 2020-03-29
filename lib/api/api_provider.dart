import 'package:dio/dio.dart';
import 'package:flutter_json/models/post_model.dart';

class ApiProvider {
  Dio dio = Dio();

  Future<List<Post>> getPosts() async {
    Response strRes = await dio.get("http://localhost:8080/getPosts");

    if (strRes.statusCode == 200) {
      List<dynamic> result = strRes.data;
      List<Post> resultJson = result.map((json) {
        return Post.fromJson(json);
      }).toList();
      return resultJson;
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Future<Post> createPost(Post post) async {
    Response createPost =
        await dio.post("http://localhost:8080/createPost", data: post.toMap());

    if (createPost.statusCode == 200) {
      return Post.fromJson(createPost.data);
    } else {
      throw Exception("Not can create post");
    }
  }

  Future<Post> deletePost(String id) async {
    Response deletePost = await dio.get("http://localhost:8080/post/${id}");

    if (deletePost.statusCode == 200) {
      return Post.fromJson(deletePost.data);
    } else {
      throw Exception("Error delete post");
    }
  }
}
