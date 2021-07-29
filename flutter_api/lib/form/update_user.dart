import 'package:flutter/material.dart';
import 'package:flutter_api/models/users.dart';
import 'package:flutter_api/pages/list_users.dart';
import 'package:flutter_api/services/user.api.dart';

class updateCase extends StatefulWidget {
  const updateCase({Key? key, required this.user}) : super(key: key);
  final Users user;
  @override
  _updateCaseState createState() => _updateCaseState();
}

class _updateCaseState extends State<updateCase> {
  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  String id = '';
  final _controllerId = TextEditingController();
  final _controllerName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

  @override
  void initState() {
    id = widget.user.id;
    _controllerId.text = widget.user.id;
    _controllerName.text = widget.user.name;
    _controllerEmail.text = widget.user.email;
    _controllerPassword.text = widget.user.password;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit user'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10.0),
                width: 440,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _controllerName,
                      decoration: const InputDecoration(
                        hintText: 'Full name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter full name';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    TextFormField(
                      controller: _controllerEmail,
                      decoration: const InputDecoration(
                        hintText: 'email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    TextFormField(
                      controller: _controllerPassword,
                      decoration: const InputDecoration(
                        hintText: 'password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_addFormKey.currentState!.validate()) {
                                _addFormKey.currentState!.save();
                                api.updateUser(
                                    id,
                                    _controllerName.text,
                                    _controllerEmail.text,
                                    _controllerPassword.text);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListUsers()),
                                );
                              }
                            },
                            child: Text('Save',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



/*// ignore: must_be_immutable
class updateCase extends StatelessWidget {
  late Users user;
  updateCase({required this.user});
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Update User';

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
          body: MyCustomForm(this.user),
        ),
      ),
    );
  }
}

// Create a Form widget.
// ignore: must_be_immutable
class MyCustomForm extends StatefulWidget {
  late Users user;
  MyCustomForm(this.user);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState(this.user);
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  late Users user;
  MyCustomFormState(this.user);

  // Create a text controller and use it to retrieve the current value of the TextField.
  TextEditingController _controllerId = new TextEditingController();
  TextEditingController _controllerName = new TextEditingController();
  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerPassword = new TextEditingController();

  /*final _controllerId = TextEditingController(text: '');
  final _controllerName = TextEditingController(text: '');
  final _controllerEmail = TextEditingController(text: '');
  final _controllerPassword = TextEditingController(text: '');*/
  var apiUser = ApiService();
  Future<Users>? _futureUser;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    // myController.dispose();
    super.dispose();
  }

  late String id;
  late String name;
  late String email;
  late String password;

  @override
  void initState() {
    super.initState();
    setState(() {
      _controllerId =
          new TextEditingController(text: widget.user.id.toString());
      _controllerName =
          new TextEditingController(text: widget.user.name.toString());
      _controllerEmail =
          new TextEditingController(text: widget.user.email.toString());
      _controllerPassword =
          new TextEditingController(text: widget.user.password.toString());

      /* id = widget.user.id;
      name = widget.user.name;
      email = widget.user.email;
      password = widget.user.password;*/
      /*TextEditingController _controllerId = new TextEditingController();
      TextEditingController _controllerName = new TextEditingController();
      TextEditingController _controllerEmail = new TextEditingController();
      TextEditingController _controllerPassword = new TextEditingController();
*/

      /*this._controllerId.value =
          TextEditingValue(text: this.users.id.toString());
      this._controllerName.value =
          TextEditingValue(text: this.users.name.toString());
      this._controllerEmail.value =
          TextEditingValue(text: this.users.email.toString());
      this._controllerPassword.value =
          TextEditingValue(text: this.users.password.toString());*/

      _futureUser = apiUser.getUserById(this.user.id);

      _controllerId.text = widget.user.id;
      _controllerName.text = widget.user.name;
      _controllerEmail.text = widget.user.email;
      _controllerPassword.text = widget.user.password;
    });
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
                    Text(snapshot.data!.name), // Text('${snapShot.data.id}')
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Enter your name',
                      ),
                      controller: _controllerName,
                      /*onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },*/
                    ),
                    Text(snapshot.data!.email),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.email),
                        hintText: 'Enter an email',
                      ),
                      controller: _controllerEmail,
                      /* onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },*/
                    ),
                    Text(snapshot.data!.password),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.password),
                        hintText: 'Enter your password',
                      ),
                      controller: _controllerPassword,
                      /* onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },*/
                    ),
                    new Container(
                        padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                        child: new ElevatedButton(
                          child: const Text('Update'),
                          onPressed: () {
                            setState(() {
                              _futureUser = apiUser.updateUser(
                                  _controllerId.text,
                                  _controllerName.text,
                                  _controllerEmail.text,
                                  _controllerPassword.text);
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListUsers()),
                            );
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Update ' +
                                      _controllerName.text.trim() +
                                      ' successfully'),
                                  // Retrieve the text the user has entered by using the
                                );
                              },
                            );
                          },
                        )),
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
