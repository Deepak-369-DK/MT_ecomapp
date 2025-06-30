import 'dart:convert';

import 'package:ecomapp/data/Models/userAuthModel.dart';
import 'package:ecomapp/domain/Repository/sharedPrefRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUsecase implements Sharedprefrepository {
  inti() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<bool?> logout() async {
    final prefs = await inti();
    await prefs.remove('user');
  }

  @override
  Future<bool?> setdata(User _userdata) async {
    try {
      UserDetails _data = UserDetails(
          userId: _userdata.uid,
          userdata: Userdata(
              uid: _userdata.uid,
              email: _userdata.email ?? "",
              password: "",
              name: _userdata.displayName ?? "",
              phone: _userdata.phoneNumber ?? "",
              createdDate: ""),
          bAddress: null,
          bankDetails: null);
      final prefs = await inti();
      final userJson = json.encode(_data.toJson());

      return await prefs.setString('user', userJson);
    } catch (e) {
      return false;
      // throw UnimplementedError();
    }
  }

  @override
  Future<Userdata>? getdata() async {
    try {
      final prefs = await inti();
      final userJson = prefs.getString('user');
      if (userJson == null) {
        Future.delayed(
          Duration(seconds: 2),
          () => null,
        );
      }
      final Map<String, dynamic> userMap = jsonDecode(userJson!);
      return Future.delayed(Duration(seconds: 2), () {
        var res = Userdata.fromJson(userMap["userdata"]);
        return res;
      });
    } catch (e) {
      final Map<String, dynamic> userMap = jsonDecode("");
      return Userdata.fromJson(userMap);
    }
  }
}
