import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomapp/data/Models/userAuthModel.dart';
import 'package:ecomapp/domain/Repository/authRepository.dart';
import 'package:ecomapp/domain/Usecases/sharedPrefUsecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authusecases implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User?> signIn(String email, String password) {
    return _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((result) async {
      if (result.user != null) {
        await SharedPrefUsecase().setdata(result.user!);
      }

      return result.user;
    }).catchError((e) {
      var s =
          "The supplied auth credential is incorrect, malformed or has expired";
      return s;
    });
  }

  @override
  Future<User?> signUp(Userdata _userdata) => _auth
          .createUserWithEmailAndPassword(
              email: _userdata.email, password: _userdata.password)
          .then((result) async {
        await setUserInDb(result, _userdata);
        return result.user;
      });

  setUserInDb(UserCredential user, Userdata _userdata) {
    try {
      if (user.user != null) {
        final _data = UserDetails(
            userId: user.user!.uid,
            userdata: _userdata,
            bAddress: null,
            bankDetails: null);
        Map<String, dynamic> userMap = _data.toJson();

        return FirebaseFirestore.instance
            .collection("users")
            .doc(user.user!.uid)
            .set(userMap);
      }
    } catch (_) {}
  }

  @override
  Future<void> sendPasswordReset(String email) {
    try {
      return _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      return Future.value(e);
    }
  }
}
