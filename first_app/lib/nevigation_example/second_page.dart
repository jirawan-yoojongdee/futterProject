import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String name;
  final int age;
  const SecondPage({super.key, required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
        backgroundColor: const Color.fromARGB(255, 85, 7, 255),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name $name'),Text('Age $age'),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, 
            child: Text('< First Page'))
          ],
        ),
      ),
    );
  }
}