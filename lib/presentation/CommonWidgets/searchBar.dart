import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:flutter/material.dart';

class CustomSearchbar extends StatelessWidget {
  const CustomSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          fillColor: AppTheme().white,
          filled: true,
          prefixIcon: Icon(Icons.search, color: AppTheme().grey_bg),
          suffixIcon: Icon(Icons.mic, color: AppTheme().grey_bg),
          hintText: 'Search any Product..',
          hintStyle: TextStyle(color: AppTheme().grey_fg),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        ),
      ),
    );
  }
}
