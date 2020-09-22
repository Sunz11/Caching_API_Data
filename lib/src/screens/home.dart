import 'package:caching_api/src/http_services/http_services.dart';
import 'package:caching_api/src/models/user_model.dart';
import 'package:caching_api/src/utils/appBar_gradient.dart';
import 'package:caching_api/src/widgets/user_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HttpService httpService = HttpService();

    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        centerTitle: true,
        flexibleSpace: appBarGradient(),
      ),
      body:  FutureBuilder(
        future: httpService.fetchUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            List<User> users = snapshot.data;
            return ListView(
              children: users
                  .map(
                    (User user) => UserCard(
                  user: user,),
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
