import 'package:flutter/foundation.dart';
import 'package:test_app/model/note_model.dart';

class NoteDataHelper extends ChangeNotifier {
  List<NoteModel> noteList = [];

  addNoteInList({required String t, required String d}) {
    NoteModel noteModel = NoteModel(
      title: t,
      description: d,
    );
    noteList.add(noteModel);
    notifyListeners();
  }
}
