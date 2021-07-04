class NoteModel {
  String title;
  String description;

  NoteModel({
    required this.title,
    required this.description,
  });
  String get getTitle => title;
  String get getDescription => description;
}
