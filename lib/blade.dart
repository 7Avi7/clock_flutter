import 'dart:math' as math;

import 'package:flutter/material.dart';

class BladePage extends StatefulWidget {
  final double rotation;

  const BladePage({Key? key, required this.rotation}) : super(key: key);

  @override
  State<BladePage> createState() => _BladePageState();
}

class _BladePageState extends State<BladePage> {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: math.pi / 180 * widget.rotation,
      child: Container(
        width: 10,
        height: 100,
        color: Colors.yellow,
      ),
    );
  }
}
