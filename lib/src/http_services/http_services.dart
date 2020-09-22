import 'dart:convert';
import 'dart:io';
import 'package:caching_api/src/models/comment_model.dart';
import 'package:caching_api/src/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:caching_api/src/models/user_model.dart';
import 'package:path_provider/path_provider.dart';

class HttpService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<User>> fetchUsers() async {

    String fileName = "UserCacheData.json";
    var cacheDir = await getTemporaryDirectory();
    File file = new File(cacheDir.path + "/" + fileName);

    if (await file.exists()) {
      print("Loading users from cache");
      print('path: $file');
      var jsonData = file.readAsStringSync();

      List<dynamic> body = jsonDecode(jsonData);

      print('RESPONSE: $body');
      List<User> users = body
          .map((dynamic item) => User.fromJson(item),
      )
          .toList();
      return users;
    }
    else {
      print("LOADING USERS FROM API");

      final response = await http.get("$baseUrl/users");

      var tempDir = await getTemporaryDirectory();
      File file = new File(tempDir.path + "/" + fileName);

      file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);

        List<User> users = body.
        map((dynamic item) => User.fromJson(item),)
            .toList();
        return users;
      } else {
        throw Exception('Failed to load Users from API');
      }
    }
  }

  Future<List<Post>> fetchPosts(User user) async {
    String fileName = "UserId_${user.id}PostsCacheData.json";
    var cacheDir = await getTemporaryDirectory();
    File file = new File(cacheDir.path + "/" + fileName);
    print('path: $file');

    if (await file.exists()) {
      print("Loading posts from cache");
      print('path: $file');
      var jsonData = file.readAsStringSync();
      List<dynamic> body = jsonDecode(jsonData);
      print('RESPONSE: $body');
      List<Post> posts = body
          .map((dynamic item) => Post.fromJson(item),
      )
          .toList();
      return posts;
    } else {
      print("LOADING POSTS FROM API");
      final response = await http.get("$baseUrl/posts?userId=${user.id}");

      var tempDir = await getTemporaryDirectory();
      File file = new File(tempDir.path + "/" + fileName);

      file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);

        List<Post> posts = body
            .map((dynamic item) => Post.fromJson(item),
        )
            .toList();
        return posts;
      } else {
        throw Exception('Failed to load Posts from API');
      }
    }
  }


  Future<List<Comment>> fetchComments(Post post) async {

    String fileName = "PostId_${post.id}CommentsCacheData.json";
    var cacheDir = await getTemporaryDirectory();
    File file = new File(cacheDir.path + "/" + fileName);
    print('path: $file');

    if (await file.exists()) {
      print("Loading comments from cache");
      print('path: $file');

      var jsonData = file.readAsStringSync();

      List<dynamic> body = jsonDecode(jsonData);
      print('RESPONSE: $body');
      List<Comment> comments = body
          .map((dynamic item) => Comment.fromJson(item),
      )
          .toList();
      return comments;
    } else {
      print("LOADING COMMENTS FROM API");
      final response = await http.get("$baseUrl/comments?postId=${post.id}");

      var tempDir = await getTemporaryDirectory();
      File file = new File(tempDir.path + "/" + fileName);

      file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);

        List<Comment> comments = body
            .map((dynamic item) => Comment.fromJson(item),
        )
            .toList();
        return comments;
      } else {
        throw Exception('Failed to load Posts from API');
      }
    }
  }

}
