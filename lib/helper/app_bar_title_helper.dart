import 'package:flutter/foundation.dart';

class AppBarTitleHelper extends ChangeNotifier {
  String title = 'Note';
  updateTitle({required String title}) {
    this.title = title;
    notifyListeners();
  }
}
