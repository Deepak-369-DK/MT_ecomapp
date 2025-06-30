import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:ecomapp/presentation/Bloc/BottomNavBloc/BottomNavBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BottomNavbar extends StatelessWidget {
  BottomNavbar({super.key});

  AppTheme _theme = AppTheme();

  @override
  Widget build(BuildContext context) {
    Color SelectedIconColor = _theme.red;
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.selectedItem.index,
          onTap: (index) {
            if (GoRouter.of(context).state.path != "/") {
              context.go("/home");
            }
            context.read<NavigationBloc>().add(NavigationEvent.values[index]);
          },
          backgroundColor: _theme.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: state.selectedItem == NavigationEvent.home
                      ? SelectedIconColor
                      : Colors.black),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,
                  color: state.selectedItem == NavigationEvent.wishlist
                      ? SelectedIconColor
                      : Colors.black),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: _theme.grey_fg,
                        spreadRadius: 0.2,
                        offset: Offset(
                          1,
                          1.4,
                        ),
                        blurRadius: 2)
                  ],
                  border: Border.all(color: Colors.white),
                  color: state.selectedItem == NavigationEvent.shop
                      ? _theme.red
                      : _theme.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(Icons.shopping_cart,
                    color: state.selectedItem == NavigationEvent.shop
                        ? _theme.white
                        : _theme.black),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search,
                  color: state.selectedItem == NavigationEvent.search
                      ? SelectedIconColor
                      : Colors.black),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,
                  color: state.selectedItem == NavigationEvent.settings
                      ? SelectedIconColor
                      : Colors.black),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
