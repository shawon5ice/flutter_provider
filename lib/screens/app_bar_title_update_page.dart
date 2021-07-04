import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/helper/app_bar_title_helper.dart';

class UpdateAppBarTitle extends StatelessWidget {
  const UpdateAppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Appbar title'),
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
                    hintText: "Update Appbar Title",
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
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_titleController.text.isNotEmpty) {
                      Provider.of<AppBarTitleHelper>(context, listen: false)
                          .updateTitle(title: _titleController.text);
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.save),
                        Text(' Update Title'),
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
