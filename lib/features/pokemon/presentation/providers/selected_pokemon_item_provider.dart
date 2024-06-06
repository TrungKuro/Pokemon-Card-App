import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class SelectedPokemonItemProvider extends ChangeNotifier {
  // Object (STATE)
  int number;

  // Hàm xây dựng
  SelectedPokemonItemProvider({
    this.number = 0,
  });

  /* ----------------------------------------------------------------------- */

  void changeNumber({required int newNumber}) {
    number = newNumber;
    notifyListeners();
  }
}
