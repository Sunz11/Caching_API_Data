import 'package:caching_api/src/models/user_model.dart';
import 'package:caching_api/src/screens/post_lists.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;
  UserCard({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0,8.0,0,8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text("${user.username.substring(0,1)}",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.teal[600],
                      )),
                ),

                title: Text(user.username,
                    style: Theme.of(context).textTheme.bodyText1),

                subtitle: Padding(
                  padding: const EdgeInsets.only(left:4.0,top: 4.0, bottom: 4.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.person,
                            size: 14,),
                          SizedBox(width: 10,),
                          Text(user.name,
                            style: Theme.of(context).textTheme.caption,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.mail,
                            size: 14,),
                          SizedBox(width: 10,),
                          Text(user.email,
                            style: Theme.of(context).textTheme.caption,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.phone,
                            size: 14,),
                          SizedBox(width: 10,),
                          Text(user.phone,
                            style: Theme.of(context).textTheme.caption,),

                        ],
                      ),

                    ],
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 16,),
                ),

                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PostList(
                      user: user,
                    ),
                  ),
                ),
              ),

            ],

          ),
        ),
      ),
    );
  }
}
