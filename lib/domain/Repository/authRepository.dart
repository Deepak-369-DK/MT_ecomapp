import 'package:ecomapp/data/Models/userAuthModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> signIn(String email, String password);

  Future<User?> signUp(Userdata userdata);

  Future<void> sendPasswordReset(String email);
}
