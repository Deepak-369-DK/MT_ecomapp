import 'package:ecomapp/core/Const/assetspath.dart';
import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:flutter/material.dart';

class Circleborderimg extends StatelessWidget {
  const Circleborderimg({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Circleborderimg(imgPath: "google.png"),
        _Circleborderimg(imgPath: "apple.png"),
        _Circleborderimg(imgPath: "facebook.png"),
      ],
    );
  }
}

class _Circleborderimg extends StatelessWidget {
  String imgPath;

  _Circleborderimg({required this.imgPath});

  final appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: appTheme.pink,
            image: DecorationImage(image: AssetImage("${Img_icons}$imgPath")),
            borderRadius: BorderRadius.circular(60),
            border: Border.all(color: appTheme.red)),
      ),
    );
  }
}
