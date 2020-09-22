import 'dart:io';

import 'package:caching_api/src/http_services/http_services.dart';
import 'package:caching_api/src/models/user_model.dart';
import 'package:caching_api/src/utils/appBar_gradient.dart';
import 'package:caching_api/src/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HttpService httpService = HttpService();

    Future<void> _deleteCacheContents() async {
      final cacheDir = await getTemporaryDirectory();
      String fileName = "UserCacheData.json";

      if (await File(cacheDir.path + "/" + fileName).exists()) {
        cacheDir.delete(recursive: true);
        print("Deleted the CacheJson file!!");
      }
    }

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: _deleteCacheContents,
        tooltip: 'Delete the Cache file',
        child: Icon(Icons.delete,
        color: Colors.teal,),
      ),
    );
  }
}
