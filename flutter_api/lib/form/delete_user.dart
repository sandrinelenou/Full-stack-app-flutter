import 'package:flutter/material.dart';
import 'package:flutter_api/models/users.dart';
import 'package:flutter_api/pages/list_users.dart';

class deleteCase extends StatelessWidget {
  deleteCase({required this.user});
  late Users user;
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('warning'),
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
  }
}


// ignore: must_be_immutable
/*class deleteCase extends StatelessWidget {
  late Users user;
  deleteCase({required this.user});
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Delete User';
    return Container(
      child: MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListUsers()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back),
                ),
              )
            ],
          ),
          body: MyCustomForm(user: this.user),
        ),
      ),
    );
  }
}

// Create a Form widget.
// ignore: must_be_immutable
class MyCustomForm extends StatefulWidget {
  late Users user;
  MyCustomForm({required this.user});
  @override
  MyCustomFormState createState() {
    return MyCustomFormState(user: this.user);
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  late Users user;
  MyCustomFormState({required this.user});
  // Create a text controller and use it to retrieve the current value of the TextField.
  // final _controllerId = TextEditingController();
  late Future<Users> _futureUser;
  var apiUser = ApiService();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    // myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _futureUser = apiUser.getUserById(user.id);
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<Users>(
          future: _futureUser,
          builder: (context, snapshot) {
            // If the connection is done,
            // check for response data or an error.
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${snapshot.data?.name ?? 'Deleted'}'),
                    Text('${snapshot.data?.email ?? 'Deleted'}'),
                    Text('${snapshot.data?.password ?? 'Deleted'}'),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          apiUser.deleteUser(snapshot.data!.id);
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListUsers()),
                        );
                      },
                      child: Text('Delete data'),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('$snapshot.error');
              }
            }
            return CircularProgressIndicator();
          }),

      /*child: Form(
        key: _formKey,
        child: Colum(),
      ),*/
    );
  }
}*/
