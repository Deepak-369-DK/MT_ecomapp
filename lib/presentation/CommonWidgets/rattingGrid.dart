import 'package:flutter/material.dart';

class Rattinggrid extends StatelessWidget {
  const Rattinggrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Icon(Icons.star, color: Colors.amber, size: 14),
          Icon(Icons.star, color: Colors.amber, size: 14),
          Icon(Icons.star, color: Colors.amber, size: 14),
          Icon(Icons.star, color: Colors.amber, size: 14),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) => RadialGradient(
              center: Alignment.centerLeft,
              stops: [0.99, 0],
              colors: [
                Colors.grey,
                Colors.white,
              ],
            ).createShader(bounds),
            child: Icon(
              Icons.star,
              size: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
