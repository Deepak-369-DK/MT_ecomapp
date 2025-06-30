import 'package:ecomapp/core/Const/assetspath.dart';
import 'package:ecomapp/data/Models/trendingProducts.dart';
import 'package:ecomapp/presentation/Bloc/BottomNavBloc/BottomNavBloc.dart';
import 'package:ecomapp/presentation/Bloc/ShopBloc/shop_bloc.dart';
import 'package:ecomapp/presentation/CommonWidgets/rattingGrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomWaterfall extends StatelessWidget {
  final int itemCount;
  List<TrendingProducts> product;

  CustomWaterfall(this.itemCount, this.product);

  final int columnCount = 2;

  double _getItemHeight(context, int index) {
    if (index % 4 == 1 || index % 4 == 2) {
      return MediaQuery.of(context).size.height / 2.5;
    } else {
      return MediaQuery.of(context).size.height / 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<List<Widget>> columns = List.generate(columnCount, (_) => []);
    List<double> columnHeights = List.filled(columnCount, 0);

    for (int i = 0; i < itemCount; i++) {
      final height = _getItemHeight(context, i);
      final widget =
          Container(height: height, child: _ProductCard(product: product[i]));

      int targetColumn =
          columnHeights.indexOf(columnHeights.reduce((a, b) => a < b ? a : b));
      columns[targetColumn].add(widget);
      columnHeights[targetColumn] += height;
    }

    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(columnCount, (i) {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: columns[i],
            ),
          );
        }),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final TrendingProducts product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    String formattedPrice = '₹${product.price.toInt()}';
    String ratingCountFormat(int count) {
      if (count > 10000000) return '${(count / 10000000).toStringAsFixed(1)}Cr';
      if (count > 100000) return '${(count / 100000).toStringAsFixed(2)}L';
      if (count > 1000) return '${(count / 1000).toStringAsFixed(1)}K';
      return count.toString();
    }

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      child: InkWell(
        onTap: () {
          context.read<NavigationBloc>().add(NavigationEvent.values[2]);
          context
              .read<ShopBloc>()
              .add(Shop_LoadProductDetail(Selected_product: product));
          //  print(product.toJson());
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "$Img_TrendProduct${product.imgPath}",
                    width: double.infinity,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[300],
                      child: Icon(Icons.image, size: 60, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  product.productName.length > 15
                      ? product.productName.substring(0, 15) + "..."
                      : product.productName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              SizedBox(height: 4),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  product.description.length > 40
                      ? product.description.substring(0, 40) + "..."
                      : product.description,
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                ),
              ),
              SizedBox(height: 4),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  formattedPrice,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              SizedBox(height: 4),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Rattinggrid(),
                    SizedBox(width: 4),
                    Text(
                      product.rating.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    SizedBox(width: 4),
                    Text(
                      ratingCountFormat(product.reviews),
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
