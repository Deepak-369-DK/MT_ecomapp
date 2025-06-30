import 'package:ecomapp/data/Models/homeModel.dart';
import 'package:flutter/material.dart';

class Hometopcategories extends StatelessWidget {
  List<Category> categories;

  Hometopcategories({required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: EdgeInsets.only(left: 4),
        separatorBuilder: (_, __) => SizedBox(width: 18),
        itemBuilder: (context, index) {
          final cat = categories[index];
          return Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(cat.image),
              ),
              SizedBox(height: 6),
              Text(
                cat.name,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              )
            ],
          );
        },
      ),
    );
  }
}
