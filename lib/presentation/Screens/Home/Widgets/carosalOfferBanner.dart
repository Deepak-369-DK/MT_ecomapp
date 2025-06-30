import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomapp/core/Const/assetspath.dart';
import 'package:flutter/material.dart';

class Carosalofferbanner extends StatelessWidget {
  Carosalofferbanner({super.key});

  List<String> imageUrls = [
    "${Img_Home}add1.png",
    "${Img_Home}add2.png",
    "${Img_Home}add3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.85,
            aspectRatio: 16 / 9,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
          ),
          items: imageUrls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    url,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                );
              },
            );
          }).toList(),
        ));
  }
}
