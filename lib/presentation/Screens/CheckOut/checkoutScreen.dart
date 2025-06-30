import 'package:ecomapp/presentation/Bloc/CartBloc/cart_bloc.dart';
import 'package:ecomapp/presentation/Bloc/CartBloc/cart_event.dart';
import 'package:ecomapp/presentation/CommonWidgets/appbar.dart';
import 'package:ecomapp/presentation/Screens/CheckOut/Widgets/itemList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Checkoutscreen extends StatelessWidget {
  const Checkoutscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc()..add(LoadCartItems()),
      child: Scaffold(
        appBar: CustomAppBar.NormalAppbar(
            centerTitle: "Checkout", leadingOnPress: () => context.pop()),
        body: Column(
          children: [CartItemsCard()],
        ),
        // bottomNavigationBar: _BottomNavBar(),
      ),
    );
  }
}
