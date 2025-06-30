import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:ecomapp/data/Models/homeModel.dart';
import 'package:ecomapp/presentation/CommonWidgets/rattingGrid.dart';
import 'package:flutter/material.dart';

class Dealoftheday extends StatelessWidget {
  List<DealOfDayProduct> dealOfDayProducts;

  Dealoftheday({super.key, required this.dealOfDayProducts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: AppTheme().blue,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Deal of the Day",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timelapse_outlined,
                            size: 18, color: Colors.white),
                        SizedBox(width: 6),
                        Text('22h 55m 20s remaining',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14)),
                      ],
                    ),
                    Center(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 1),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme().blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)),
                                padding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 16)),
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('View all',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                                SizedBox(width: 6),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        Container(
          height: 256,
          color: AppTheme().white,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: dealOfDayProducts.length,
            separatorBuilder: (_, __) => SizedBox(width: 14),
            itemBuilder: (context, i) {
              final p = dealOfDayProducts[i];
              return Container(
                width: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 10,
                          offset: Offset(0, 5))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(14)),
                      child: Image.asset(
                        p.image,
                        height: 130,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            p.title,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            p.desc,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[700]),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                p.price,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              SizedBox(width: 8),
                              Text(
                                p.oldPrice.toString(),
                                style: TextStyle(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 12),
                              ),
                              SizedBox(width: 4),
                              Text(
                                p.discount!,
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Rattinggrid(),
                              Text(
                                p.rating.toString(),
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 12),
                              ),
                              SizedBox(width: 4),
                              Text(
                                '(${p.reviewCount})',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
