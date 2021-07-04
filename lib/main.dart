import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/helper/app_bar_title_helper.dart';
import 'package:test_app/screens/home_page.dart';
import 'package:test_app/helper/note_data_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppBarTitleHelper>(
            create: (context) => AppBarTitleHelper()),
        ChangeNotifierProvider<NoteDataHelper>(
            create: (context) => NoteDataHelper()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.amber),
        home: HomePage(),
      ),
    );
  }
}
