import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 236, 90, 195),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Color Layout', style: TextStyle(color: Colors.white)),
        centerTitle: false,
        //backgroundColor: Colors.indigo,
      ),
  backgroundColor: Colors.green,
      body:Center(child:Stack(
        
        children: [
          Container(
            height: 300,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(20)
            ),
            
          ),

          Positioned(
            top: 20,
            left: 20,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.red
              ),
            )),
          Positioned(
            top: 110,
            left: 20,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.yellow
              ),
            )),
            Positioned(
            top: 200,
            left: 20,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.green
              ),
            )),
          
        ],
      ))
    );
  }
}
