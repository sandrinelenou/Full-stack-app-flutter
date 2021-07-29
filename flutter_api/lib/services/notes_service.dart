import 'package:flutter_api/models/note_for_listing.dart';

class NotesService {
  List<NoteForListing> getNotesList() {
    return [
      new NoteForListing(
          noteID: "1", noteTitle: "note1", lastestEditDateTime: DateTime.now()),
      new NoteForListing(
          noteID: "2", noteTitle: "note2", lastestEditDateTime: DateTime.now()),
      new NoteForListing(
          noteID: "3", noteTitle: "note3", lastestEditDateTime: DateTime.now()),
    ];
  }
}
