import 'package:first_app/component/custom_counter_widget.dart';
import 'package:flutter/material.dart';

class SimpleCustomWidget extends StatefulWidget {
  const SimpleCustomWidget({super.key});

  @override
  State<SimpleCustomWidget> createState() => _SimpleCustomWidgetState();
}

class _SimpleCustomWidgetState extends State<SimpleCustomWidget>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Custom Widget")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomCounterWidget(title: 'TEAM A', color:Colors.blue, setTeamWin: (Color color) {
              setState(() {
                var teamWin = color;
              });
            },),
           CustomCounterWidget(title: 'TEAM B', color:Colors.red, setTeamWin: (Color color) {  },)
          ],
        ),
      ),
    );
  }
}