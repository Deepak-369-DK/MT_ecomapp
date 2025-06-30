import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Color bgColor;
  final IconData? leadIcon;
  final Widget? endIcon;
  final bool textSecure;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.bgColor,
    this.leadIcon,
    this.endIcon,
    this.textSecure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        obscureText: textSecure,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: bgColor,
          prefixIcon: leadIcon != null ? Icon(leadIcon) : null,
          suffixIcon: endIcon != null ? endIcon : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.red)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey.shade500)),
        ),
      ),
    );
  }
}
