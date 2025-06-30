import 'package:ecomapp/presentation/Bloc/WishListBloc/wishlist_bloc.dart';
import 'package:ecomapp/presentation/CommonWidgets/appbar.dart';
import 'package:ecomapp/presentation/CommonWidgets/headerSortbar.dart';
import 'package:ecomapp/presentation/CommonWidgets/searchBar.dart';
import 'package:ecomapp/presentation/Screens/WishList/widgets/productGrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WishlistBloc()..add(LoadProducts()),
      child: Scaffold(
        appBar: CustomAppBar.IconAppbar(),
        body: Column(
          children: [
            CustomSearchbar(),
            CustomHeadersortbar(
              headersortbarLabel: '52,082+ Iteams',
            ),
            Expanded(child: ProductGrid()),
          ],
        ),
        // bottomNavigationBar: _BottomNavBar(),
      ),
    );
  }
}

///----------
