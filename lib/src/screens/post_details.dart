import 'package:caching_api/src/models/post_model.dart';
import 'package:caching_api/src/utils/appBar_gradient.dart';
import 'package:caching_api/src/widgets/post_detail_card.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  PostDetail(this.post);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        flexibleSpace: appBarGradient(),
      ),
      body: PostDetailCard(post),
    );
  }
}
