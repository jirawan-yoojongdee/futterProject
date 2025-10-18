import 'package:flutter/material.dart';

class traffic_lighState extends StatefulWidget {
  const traffic_lighState({super.key});

  @override
  State<traffic_lighState> createState() => traffic_lighStateState();
}

class traffic_lighStateState extends State<traffic_lighState> {
 double _opacity = 1.0;
 int count = 0;

  void _nextLight(){
    setState(() {
      count = (count + 1) % 3;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Traffic Light Animation"),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            AnimatedOpacity(opacity: count == 0 ? 1.0 : 0.3
            , duration: const Duration(milliseconds: 500),
            child:   Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            ),

            SizedBox(height: 20),
            AnimatedOpacity(opacity: count == 1 ? 1.0 : 0.3
            , duration: const Duration(milliseconds: 500),
            child:  Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 244, 244, 54),
                shape: BoxShape.circle,
              ),
            ),
            ),

           

            SizedBox(height: 20),

            AnimatedOpacity(opacity: count == 2 ? 1.0 : 0.3
            , duration: const Duration(milliseconds: 500),
            child:  Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 54, 244, 60),
                shape: BoxShape.circle,
              ),
            ),
),

           
            SizedBox(height: 20),

            ElevatedButton(
              onPressed:_nextLight,
              child: Text("เปลี่ยนไฟ"))
          ],
        ),
      ),
    );
  }
}

