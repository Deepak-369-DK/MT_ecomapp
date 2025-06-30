import 'package:ecomapp/core/Const/assetspath.dart';
import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:flutter/material.dart';

class CustomAppBar {
  static PreferredSizeWidget IconAppbar() {
    return AppBar(
      backgroundColor: AppTheme().appBg,
      elevation: 0,
      leading: const Icon(Icons.menu, color: Colors.grey),
      centerTitle: true,
      title: SizedBox(
        height: 40,
        child: Image.asset(
          'assets/appLogo.png',
          fit: BoxFit.cover,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("${Img_icons}user.png"),
            backgroundColor: Colors.grey,
          ),
        ),
      ],
    );
  }

  static PreferredSizeWidget NormalAppbar(
      {void Function()? leadingOnPress,
      String? centerTitle,
      Widget? rightWidget}) {
    return AppBar(
      backgroundColor: AppTheme().appBg,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
        onPressed: leadingOnPress,
      ),
      centerTitle: true,
      title: Text(centerTitle ?? "".toString()),
      actions: [
        rightWidget ?? SizedBox(),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
