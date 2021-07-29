import 'package:flutter/material.dart';
import 'package:flutter_api/models/note_for_listing.dart';
import 'package:flutter_api/pages/note_delete.dart';
import 'package:flutter_api/pages/note_modify.dart';
import 'package:flutter_api/services/notes_service.dart';

class NoteList extends StatelessWidget {
  final notes = [
    new NoteForListing(
        noteID: "1", noteTitle: "note1", lastestEditDateTime: DateTime.now()),
    new NoteForListing(
        noteID: "2", noteTitle: "note2", lastestEditDateTime: DateTime.now()),
    new NoteForListing(
        noteID: "3", noteTitle: "note3", lastestEditDateTime: DateTime.now()),
  ];
  //consume service
  final service = NotesService();

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => NoteModify(
                    noteID: '',
                  )));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
          itemBuilder: (_, index) {
            return Dismissible(
              key: ValueKey(notes[index].noteID),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {},
              confirmDismiss: (direction) async {
                final result = await showDialog(
                    context: context, builder: (_) => NoteDelete());
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
              child: ListTile(
                  title: Text(notes[index].noteTitle),
                  subtitle: Text(
                      'Last edited o ${formatDateTime(notes[index].lastestEditDateTime)}'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) =>
                            NoteModify(noteID: notes[index].noteID)));
                  }),
            );
          },
          separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
          itemCount: notes.length),
    );
  }
}
