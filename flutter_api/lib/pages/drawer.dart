// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_api/form/form_screen.dart';

import 'list_users.dart';

// Press the Navigation Drawer button to the left of AppBar to show
// a simple Drawer with two items.
class NavDrawerDemo extends StatelessWidget {
  //const NavDrawerDemo({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('Sandrine'),
      accountEmail: Text('noel@gmail.com'),
      currentAccountPicture: const CircleAvatar(
        child: FlutterLogo(size: 22.0),
      ),
    );

    return Drawer(
      child: ListView(
        children: [
          drawerHeader,
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FormScreen(
                          id: '',
                          password: '',
                          name: '',
                          email: '',
                        )),
              );
            },
            child: ListTile(
              title: Text('add User'),
              leading: const Icon(Icons.favorite),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListUsers()),
              );
            },
            child: ListTile(
              title: Text('List Users'),
              leading: const Icon(Icons.comment),
            ),
          ),
        ],
      ),
    );
  }
}
