import 'package:flutter/material.dart';

class Addbanner extends StatelessWidget {
  String imgPath;
  double height;

  Addbanner({required this.imgPath, this.height = 200});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage(imgPath), fit: BoxFit.fill)),
        )),
      ],
    );
  }
}
