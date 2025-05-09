import 'package:flutter/material.dart';

MainEventLocationHnadler handler = MainEventLocationHnadler();

class MainEventLocationHnadler extends ChangeNotifier {
  bool onSite = true;
  changeOnSite(bool value) {
    onSite = value;
    notifyListeners();
  }
}
