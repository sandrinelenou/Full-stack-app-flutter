import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/form/addUser.dart';
import 'package:flutter_api/form/delete_user.dart';
import 'package:flutter_api/models/users.dart';
import 'package:flutter_api/pages/detail_user.dart';

import 'package:flutter_api/services/user.api.dart';

class ListUsers extends StatefulWidget {
  late List<Users> users;
  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  //late Future<Users> _futureUser;

  @override
  void initState() {
    super.initState();
    //_futureUser = getUsers() as Future<Users>;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();
    var apiUser = ApiService();

    return Scaffold(
      appBar: AppBar(
        title: Text('List Users'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => addUser()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.create),
            ),
          )
        ],
      ),
      body: Container(
          child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {});
            },
            controller: editingController,
            decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: FutureBuilder(
            future: apiUser.getUsers(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                // var response = snapshot.data as List<Users>;
                return ListView.builder(
                    //snapshot.data.length, response.length
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        //key: ValueKey(users[index].id),
                        key: ObjectKey(snapshot.data[index].id),
                        direction: DismissDirection.startToEnd,
                        onDismissed: (direction) {
                          apiUser.deleteUser(
                              (snapshot.data[index].id).then((value) => value));
                        },
                        confirmDismiss: (direction) async {
                          final result = await showDialog(
                              context: context,
                              builder: (_) =>
                                  deleteCase(user: snapshot.data[index].id));
                          print(result);
                          return result;
                        },
                        background: Container(
                          color: Colors.red,
                          padding: EdgeInsets.only(left: 16),
                          child: Align(
                            child: Icon(Icons.delete, color: Colors.white),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        child: Card(
                          child: ListTile(
                            title: Text(
                              snapshot.data[index].name, //userItem.name,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            subtitle: Text(
                              snapshot.data[index].email,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserDetails(
                                        user: snapshot.data[index])),
                              );
                            },
                          ),
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
        ),
      ])),
    );
  }
}
