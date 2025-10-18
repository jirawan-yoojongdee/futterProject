import 'package:flutter/material.dart';

class _traffic_lighState extends StatefulWidget {
  const _traffic_lighState({super.key});

  @override
  State<_traffic_lighState> createState() => __traffic_lighStateState();
}

class __traffic_lighStateState extends State<_traffic_lighState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}