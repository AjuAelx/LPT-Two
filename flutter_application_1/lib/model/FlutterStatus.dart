import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckStatus with ChangeNotifier {
  String who, what;
  bool _isAuthentificated = true;

  bool get isAuthentificated {
    return this._isAuthentificated;
  }

  set isAuthentificated(bool newVal) {
    this._isAuthentificated = newVal;
    this.notifyListeners();
  }

  //////////////////////////////////////////

  void saveSignUpData(String text) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('Value', text);
    // preferences.setString('What', what);
    _isAuthentificated = true;
    notifyListeners();
  }

  // void naviGate(){
  //   _isAuthentificated = true;
  //   notifyListeners();
  // }
}
