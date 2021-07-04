import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/helper/note_data_helper.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Note'),
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: "Title",
                    hintText: "Enter Note Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  maxLength: 10,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: "Description",
                    hintText: "Describe here",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    print(_titleController.text.isNotEmpty);
                    if (_titleController.text.isNotEmpty &&
                        _descriptionController.text.isNotEmpty) {
                      Provider.of<NoteDataHelper>(
                        context,
                        listen: false,
                      ).addNoteInList(
                          t: _titleController.text,
                          d: _descriptionController.text,);
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.save),
                        Text(' Save Note'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
