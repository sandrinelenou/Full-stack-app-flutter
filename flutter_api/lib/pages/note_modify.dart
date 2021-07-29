import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  String noteID;
  bool get isEditing => noteID != null;
  NoteModify({required this.noteID});
  //const NoteModify({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(noteID == '' ? 'Create note' : 'Edit note')),
      //appBar: AppBar(title: Text(isEditing ? 'Edit note' : 'Create note')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(hintText: 'Note title')),
            Container(height: 8),
            TextField(decoration: InputDecoration(hintText: 'Note content')),
            Container(height: 16),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: ElevatedButton(
                  onPressed: () {
                    if (isEditing) {
                      //update notes in api
                    } else {
                      //create notes in api

                    }
                    Navigator.of(context).pop();
                  },
                  child: Text('Submit', style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}
