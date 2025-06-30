import 'package:ecomapp/core/Const/assetspath.dart';
import 'package:flutter/material.dart';

class Specialoffercard extends StatelessWidget {
  const Specialoffercard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('${Img_Home}spclOffer.png'),
                    fit: BoxFit.contain)),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Special Offers',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('${Img_Home}imoji.png'),
                    )
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  'We make sure you get the offer you need at best prices',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
