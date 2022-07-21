import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
class Shared {
  List l1 = [];

  void createShr(
      {String? email, String? password}) async {
    var shr = await SharedPreferences.getInstance();
    shr.setString("e1", email!);
    shr.setString("p1", password!);
  }

  Future<List> readSHR() async {
    var shr = await SharedPreferences.getInstance();
    var email = shr.getString("g1");
    var password = shr.getString("p1");

    l1.addAll([email,password]);
    return l1;
  }
}
