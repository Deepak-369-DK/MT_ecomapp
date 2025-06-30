import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:ecomapp/data/Models/userAuthModel.dart';
import 'package:ecomapp/domain/Usecases/sharedPrefUsecase.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splasscreen extends StatelessWidget {
  const Splasscreen({super.key});

  Future<Userdata?> initPrefs() async {
    var prefUsecase = SharedPrefUsecase();

    return await prefUsecase.getdata();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Userdata?>(
      future: initPrefs(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: _splasScreen());
        }
        if (snapshot.connectionState == ConnectionState.done) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final result = snapshot.data;
            if (result != null) {
              context.go('/home');
            } else {
              context.go('/multiSplash');
            }
          });

          return _splasScreen();
        }

        return Scaffold(body: _splasScreen());
      },
    );
  }
}

Widget _splasScreen() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    color: AppTheme().white,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 70),
        child: Image.asset("assets/appLogo.png"),
      ),
    ),
  );
}
