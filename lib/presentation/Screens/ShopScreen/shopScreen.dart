import 'package:ecomapp/core/Const/assetspath.dart';
import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:ecomapp/data/Models/trendingProducts.dart';
import 'package:ecomapp/presentation/Bloc/ShopBloc/shop_bloc.dart';
import 'package:ecomapp/presentation/CommonWidgets/appbar.dart';
import 'package:ecomapp/presentation/CommonWidgets/rattingGrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({
    Key? key,
  }) : super(key: key);
  final _product = TrendingProducts(
      productId: 100,
      productName: "NIke Sneakers",
      description: "Vision Alta Men’s Shoes Size (All Colours)",
      price: 1500,
      rating: 4,
      reviews: 4534,
      imgPath: "NIkeSneakers.png");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar.NormalAppbar(rightWidget: Icon(Icons.shopping_cart_outlined),leadingOnPress: () => context.pop()),
      body: SafeArea(
        child: BlocConsumer<ShopBloc, ShopState>(
          listener: (context, state) {
            if (state is ProductAddedToCart) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Product added to cart!')),
              );
            }
            if (state is ProductDetailError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is ShopProductDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ShopProductDetailLoaded) {
              return _buildProductDetail(
                  context, state.product, state.selectedSize);
            }
            if (state is ProductDetailError) {
              return Center(child: Text(state.message));
            }
            if (state is ShopProductDetailInitial) {
              context
                  .read<ShopBloc>()
                  .add(Shop_LoadProductDetail(Selected_product: _product));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildProductDetail(
      BuildContext context, TrendingProducts product, String selectedSize) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child: PageView(
              children: [
                Image.asset("$Img_TrendProduct${product.imgPath}",
                    fit: BoxFit.contain),
                Container(color: Colors.grey[300]),
                Container(color: Colors.grey[400]),
                Container(color: Colors.grey[500]),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text('Size: $selectedSize UK',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, index) {
                String size = (index + 6).toString();
                bool isSelected = size == selectedSize;

                return GestureDetector(
                  onTap: () {
                    context
                        .read<ShopBloc>()
                        .add(SelectSize((index + 6).toString()));
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.redAccent : Colors.white,
                      border: Border.all(color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "${index + 6} UK",
                        style: TextStyle(
                          color: isSelected ? AppTheme().red : Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Text(product.productName,
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(product.description,
              style: const TextStyle(color: Colors.black)),
          const SizedBox(height: 16),
          Row(
            children: [
              Rattinggrid(),
              Text(
                "56,890",
                style: TextStyle(color: AppTheme().grey_fg),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                "₹2,999",
                style: TextStyle(
                    color: Colors.grey, decoration: TextDecoration.underline),
              ),
              Text("₹1,500"),
              Text(
                "50% Off",
                style: TextStyle(color: AppTheme().red),
              )
            ],
          ),
          const SizedBox(height: 8),
          const Text("Product Details",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
          const Text(
              "Perhaps the most iconic sneaker of all-time, this original Chicago? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the...more",
              style: const TextStyle(color: Colors.black)),
          Row(
            children: [
              InkWell(
                onTap: () {
                  context.push("/cartList");
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("${Img_icons}goToCart.png"),
                          fit: BoxFit.fill)),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  context.push("/shipping", extra: product.price.toDouble());
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("${Img_icons}buyNow.png"),
                          fit: BoxFit.fill)),
                ),
              )
            ],
          ),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 24),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme().pink,
                borderRadius: BorderRadius.circular(8),
              ),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Delivery in',
                  style: TextStyle(
                      color: AppTheme().black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                TextSpan(
                  text: '\n1 within Hour',
                  style: TextStyle(
                      color: AppTheme().black,
                      fontWeight: FontWeight.w800,
                      fontSize: 24),
                ),
              ]))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  height: 50,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.remove_red_eye_outlined,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Text('View Similar'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  height: 50,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.compare_arrows,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Text('Add to Compare'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('Similar To 282+ Items',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      ),
    );
  }
}
