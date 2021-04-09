import 'package:flutter/cupertino.dart';

class FlutterModel with ChangeNotifier{
  String who;
  String loginORSignup;

   void loginWithCustomer() {
    who = "Customer";
    loginORSignup = "Login";
    notifyListeners();
  }

  void loginWithSeller() {
    who = "Seller";
    loginORSignup = "Login";
    notifyListeners();
  }

  void signUpWithCustomer() {
    who = "Customer";
    loginORSignup = "Sign Up";
    notifyListeners();
  }

  void signUpWithSeller() {
    who = "Seller";
    loginORSignup = "Sign Up";
    notifyListeners();
  }
  
}