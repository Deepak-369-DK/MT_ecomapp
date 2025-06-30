import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:ecomapp/presentation/Bloc/WishListBloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHeadersortbar extends StatelessWidget {
  String headersortbarLabel;

  CustomHeadersortbar({super.key, required this.headersortbarLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(headersortbarLabel,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
        ),
        _SortFilterBar()
      ],
    );
  }
}

class _SortFilterBar extends StatelessWidget {
  final List<String> sortOptions = [
    'None',
    'Price Low to High',
    'Price High to Low',
    'Rating'
  ];

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WishlistBloc>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: Text('Sort'),
                    children: sortOptions.map((sort) {
                      return SimpleDialogOption(
                        child: Text(sort),
                        onPressed: () {
                          Navigator.pop(context);
                          bloc.add(SortProducts(sort));
                        },
                      );
                    }).toList(),
                  );
                },
              );
            },
            icon: Icon(Icons.compare_arrows),
            label: Text("Sort"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme().white,
              elevation: 0,
              foregroundColor: AppTheme().black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.filter_list),
            label: Text("Filter"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme().white,
              elevation: 0,
              foregroundColor: AppTheme().black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          )
        ],
      ),
    );
  }
}
