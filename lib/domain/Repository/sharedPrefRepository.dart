import 'package:ecomapp/data/Models/userAuthModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Sharedprefrepository {
  Future<bool?> setdata(User userdata);

  Future<Userdata>? getdata();

  Future<bool?> logout();
}
