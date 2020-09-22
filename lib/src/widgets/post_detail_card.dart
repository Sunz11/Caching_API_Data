import 'package:caching_api/src/http_services/http_services.dart';
import 'package:caching_api/src/models/comment_model.dart';
import 'package:caching_api/src/models/post_model.dart';
import 'package:flutter/material.dart';

class PostDetailCard extends StatelessWidget {
  final Post post;
  PostDetailCard(this.post);

  @override
  Widget build(BuildContext context) {
    HttpService httpService = HttpService();

    return  Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 25.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black38,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: <Color>
                    [
                      Colors.black.withOpacity(0.8),

                      Colors.teal[600].withOpacity(0.8),

                    ])
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 20.0),
                    child: ListTile(
                      leading: Hero(
                        tag: "${post.id}",
                        child: CircleAvatar(
                          radius: 23,

                          backgroundColor: Colors.black,
                          child: Text("${post.id}",
                              style: Theme.of(context).textTheme.headline5.copyWith(
                                color: Colors.teal[600],
                              )),
                        ),
                      ),
                      title: Text(post.title,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.white
                          )),
                    ),
                  ),

                  ListTile(
                    subtitle: Text(post.body,
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.white,
                      ),),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                      child: Text("Posted By userID - ${post.userId}",
                        style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),),
                  ),

                ]

            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Comments",
              style: Theme.of(context).textTheme.bodyText2,),
          ),
        ),
        FutureBuilder(
          future: httpService.fetchComments(post),
          builder: (BuildContext context, AsyncSnapshot<List<Comment>> snapshot) {
            if (snapshot.hasData) {
              List<Comment> comments = snapshot.data;
              return Expanded(
                child: ListView(
                  padding: EdgeInsets.all(12.0),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: comments
                      .map(
                          (Comment comment) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.person,
                                size: 12,
                                color: Colors.teal,),
                              SizedBox(width: 10),
                              Flexible(
                                child: Container(
                                  child: Text(comment.name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.headline5.copyWith(
                                      fontSize: 16,
                                    ),),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.email,
                                size: 12,
                                color: Colors.teal,),
                              SizedBox(width: 10),
                              Text(comment.email,
                                style: Theme.of(context).textTheme.caption.copyWith(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(comment.body,
                              style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 14.0,
                              ),),
                          ),
                          Divider(),

                        ],
                      )
                  )
                      .toList(),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },

        )
      ],
    );
  }
}
