import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/models/users.dart';
import 'package:flutter_api/services/api.dart';

class ListUsers extends StatefulWidget {
  /*final String id;
  final String name;
  final String email;
  final String password;*/

  //ListUsers({required this.id, required this.name, required this.email,  required this.password});

  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List CRUD Users'),
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: getUsers(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                var response = snapshot.data as List<Users>;
                return ListView.builder(
                    itemCount: response.length,
                    itemBuilder: (context, index) {
                      var userItem = response[index];
                      return Card(
                        child: Column(
                          children: <Widget>[
                            Text(
                              userItem.name,
                              style: Theme.of(context).textTheme.title,
                            ),
                            Text(
                              userItem.email,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              userItem.password,
                              style: Theme.of(context).textTheme.subtitle2,
                            )
                          ],
                        ),
                      );
                    });
                /*return Center(
                  child: Text('success'),
                );*/
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
