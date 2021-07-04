import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/helper/app_bar_title_helper.dart';
import 'package:test_app/helper/note_data_helper.dart';
import 'package:test_app/screens/adding_page.dart';
import 'package:test_app/screens/app_bar_title_update_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<AppBarTitleHelper>(
          builder: (context, appBarTitle, child) {
            return Text(appBarTitle.title == "" ? "Notes" : appBarTitle.title);
          },
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateAppBarTitle(),
                ),
              );
            },
            child: Icon(Icons.upcoming),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<NoteDataHelper>(
        builder: (context, notes, child) {
          return notes.noteList.length > 0
              ? ListView.builder(
                  itemCount: notes.noteList.length,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(notes.noteList[index].title),
                      subtitle: Text(notes.noteList[index].description),
                    );
                  })
              : Center(
                  child: Text('No notes to display'),
                );
        },
      ),
    );
  }
}
