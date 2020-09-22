import 'dart:convert';

import 'package:caching_api/src/models/comment_model.dart';
import 'package:caching_api/src/models/post_model.dart';
import 'package:caching_api/src/models/user_model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<User>> fetchUsers() async {
    final String userUrl = '$baseUrl/users';

      final response = await http.get(userUrl);

      if(response.statusCode == 200){
        List<dynamic> body = jsonDecode(response.body);
        List<User> users = body
            .map((dynamic item) => User.fromJson(item),
        )
            .toList();
        return users;
      } else {
        throw Exception("Failed to load Users.");
      }
    }

  Future<List<Post>> fetchPosts(User user) async {
    final String postUrl = '$baseUrl/posts?userId=${user.id}';

    final response = await http.get(postUrl);

    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      List<Post> posts = body
          .map((dynamic item) => Post.fromJson(item),
      )
          .toList();
      return posts;
    } else {
      throw Exception("Failed to load Posts.");
    }
  }

  Future<List<Comment>> fetchComments(Post post) async {
    final String commentUrl = '$baseUrl/comments?postId=${post.id}';

    final response = await http.get(commentUrl);

    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      List<Comment> comments = body
          .map((dynamic item) => Comment.fromJson(item),
      )
          .toList();
      return comments;
    } else {
      throw Exception("Failed to load Comments.");
    }
  }

}
