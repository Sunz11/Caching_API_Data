import 'package:caching_api/src/http_services/http_services.dart';
import 'package:caching_api/src/models/post_model.dart';
import 'package:caching_api/src/models/user_model.dart';
import 'package:caching_api/src/screens/post_details.dart';
import 'package:flutter/material.dart';

class PostListCard extends StatelessWidget {
  final User user;
  final Post post;
  PostListCard(this.user,this.post);

  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Hero(
                tag: "${post.id}",
                child: CircleAvatar(
                  radius: 21,
                  backgroundColor: Colors.black,
                  child: Text("${post.id}",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.teal[600],
                    ),),
                ),
              ),

              title: Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                child: Text(post.title,
                  style: Theme.of(context).textTheme.bodyText1,),
              ),

              subtitle: Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.create,
                          size: 14,),
                        SizedBox(width: 10,),
                        Text("Posted by: ${user.username}",
                          style: Theme.of(context).textTheme.caption,),
                      ],
                    ),
                    Text("UserID: ${post.userId}",
                      style: Theme.of(context).textTheme.caption,),
                  ],
                ),
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PostDetail(post),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
