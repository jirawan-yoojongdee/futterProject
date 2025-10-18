import 'package:flutter/material.dart';

class _AnimatedTesState extends StatefulWidget {
  const _AnimatedTesState({super.key});

  @override
  State<_AnimatedTesState> createState() => __AnimatedTesStateState();
}

class __AnimatedTesStateState extends State<_AnimatedTesState> {
  double _size = 100;
  Color _color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
           Container(
            height: 100,
            width: 100,
            color: Colors.red,
            ),
            SizedBox(height: 20,),
        ]
         
        ),
       
      ),
    );
  }
}