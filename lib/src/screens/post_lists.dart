import 'package:caching_api/src/http_services/http_services.dart';
import 'package:caching_api/src/models/post_model.dart';
import 'package:caching_api/src/models/user_model.dart';
import 'package:caching_api/src/utils/appBar_gradient.dart';
import 'package:caching_api/src/widgets/post_list_card.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  final User user;
  PostList({@required this.user});

  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("${user.username}'s Posts"),
        centerTitle: true,
        flexibleSpace: appBarGradient(),
      ),
      body: FutureBuilder(
        future: httpService.fetchPosts(user),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data;
            return ListView(
              children: posts
                  .map(
                    (Post post) => PostListCard(user, post),
              )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
