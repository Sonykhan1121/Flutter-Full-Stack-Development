import 'package:flutter/material.dart';

class TextExpandedProvider extends ChangeNotifier{

  bool _isExpanded  = false;

  void toggleExpanded() {
    _isExpanded =!_isExpanded;
    notifyListeners();
  }

  bool get isExpanded => _isExpanded;
}