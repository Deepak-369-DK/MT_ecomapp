import 'package:ecomapp/presentation/Bloc/BottomNavBloc/BottomNavBloc.dart';
import 'package:ecomapp/presentation/Screens/Home/Widgets/getStart.dart';
import 'package:ecomapp/presentation/Screens/Home/Widgets/homeUI.dart';
import 'package:ecomapp/presentation/Screens/ShopScreen/shopScreen.dart';
import 'package:ecomapp/presentation/Screens/WishList/wishList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Widgets/bottomNavbar.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavbar(),
      body: Column(
        children: [
          BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
              return Expanded(
                child: HomeSreenwidgwts(state.selectedItem) ??
                    Container(
                      height: 40,
                      width: 50,
                      color: Colors.orange,
                    ),
              );
              ;
            },
          )
        ],
      ),
    ));
  }
}

Widget? HomeSreenwidgwts(NavigationEvent selected) {
  switch (selected) {
    case NavigationEvent.home:
      return HomeScreen2();
    case NavigationEvent.wishlist:
      return WishListScreen();
    case NavigationEvent.shop:
      return ShopScreen();
    case NavigationEvent.search:
      return Getstart();
    case NavigationEvent.settings:
      return Center(
        child: Container(
          height: 40,
          width: 50,
          color: Colors.green,
        ),
      );
  }
}
