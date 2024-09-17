import 'package:flutter/material.dart';

class Pixel extends StatefulWidget {
  var color;
  var child;
  Pixel({super.key, required this.color, required this.child});

  @override
  State<Pixel> createState() => _PixelState();
}

class _PixelState extends State<Pixel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          widget.child,
          style: TextStyle(color: Colors.white),
        ),
      ),
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
    );
  }
}
