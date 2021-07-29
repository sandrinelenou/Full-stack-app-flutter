import 'package:flutter/material.dart';
import 'package:flutter_api/form/update_user.dart';
import 'package:flutter_api/models/users.dart';
import 'package:flutter_api/pages/list_users.dart';
import 'package:flutter_api/services/user.api.dart';

class UserDetails extends StatelessWidget {
  final apiUser = new ApiService();
  late final Users user;
  String id = '';

  //In the constructor, require a Movie
  UserDetails({Key? key, required this.user}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail User '),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(title: Text(user.name), subtitle: Text(user.email)),
              ButtonTheme(
                child: ButtonBar(
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text('Edit',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => updateCase(
                                    user: user,
                                  )),
                        );
                      },
                    ),
                    ElevatedButton(
                      child: const Text('Delete',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        apiUser.deleteUser(user.id);
                        _showDialog(context);
                      },
                    ),

                    /* ElevatedButton(
                      child: const Text('Delete',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        apiUser.deleteUser(user.id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  deleteCase(user: this.user)),
                        );
                      },
                    ),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning'),
          content: Text('Are you sure you want to delete this user?'),
          actions: [
            TextButton(
              onPressed: () {
                //Navigator.of(context).pop(true);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListUsers()),
                );
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            )
          ],
        );
      },
    );
  }
}
