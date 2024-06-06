import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class SelectedPageProvider extends ChangeNotifier {
  // Object (STATE)
  int selectedPage;

  // Hàm xây dựng
  SelectedPageProvider({
    this.selectedPage = 0,
  });

  /* ----------------------------------------------------------------------- */

  void changePage(int newValue) {
    selectedPage = newValue;
    notifyListeners();
  }
}
