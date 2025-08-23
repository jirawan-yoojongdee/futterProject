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
      backgroundColor: const Color.fromARGB(255, 245, 221, 186),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 600,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(45),
                image: DecorationImage(
                  image: AssetImage("02.jpg"),
                  fit: BoxFit.cover, // ปรับขนาดรูปให้เต็ม container
                ),
              ),
            ),
            Positioned(
              top: 400,
              child: Container(
              width: 500,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(255, 0, 0, 0).withOpacity(0.0), // โปร่งแสงมาก (ใสกว่า)
                    const Color.fromARGB(255, 0, 0, 0).withOpacity(0.4), // โปร่งแสงน้อย (เห็นชัดกว่า)
                  ],
                ),
              ),
            ),),

            Positioned(
              top: 400,
              left: 20,
              child: Container(
                child: Text(
                  "   จิราวรรณ อยู่จงดี",
                  style: TextStyle(
                    fontSize: 24, // ขนาดตัวอักษร
                    fontWeight: FontWeight.bold, // ตัวหนา
                    color: const Color.fromARGB(255, 0, 0, 0), // สีตัวอักษร
                    letterSpacing: 2.0, // ระยะห่างระหว่างตัวอักษร
                    wordSpacing: 5.0, // ระยะห่างระหว่างคำ
                    //fontStyle: FontStyle.italic, // ตัวเอียง
                  ),
                ),
              ),
            ),
            Positioned(
              top: 430,
              left: 20,
              child: Container(
                child: Text(
                  "   รหัสนักศึกษา : 650710051",
                  style: TextStyle(
                    fontSize: 16, // ขนาดตัวอักษร

                    color: const Color.fromARGB(255, 0, 0, 0), // สีตัวอักษร
                    letterSpacing: 2.0, // ระยะห่างระหว่างตัวอักษร
                    wordSpacing: 4.0, // ระยะห่างระหว่างคำ
                  ),
                ),
              ),
            ),
            Positioned(
              top: 450,
              left: 20,
              child: Container(
                child: Text(
                  "   สาขาวิชาเอก : สาขาวิทยาการคอมพิวเตอร์",
                  style: TextStyle(
                    fontSize: 16, // ขนาดตัวอักษร

                    color: const Color.fromARGB(255, 0, 0, 0), // สีตัวอักษร
                    letterSpacing: 2.0, // ระยะห่างระหว่างตัวอักษร
                    wordSpacing: 4.0, // ระยะห่างระหว่างคำ
                  ),
                ),
              ),
            ),
            Positioned(
              top: 470,
              left: 20,
              child: Container(
                child: Text(
                  "   สิ่งที่สนใจศึกษา : การออกแบบ UX/UI",
                  style: TextStyle(
                    fontSize: 16, // ขนาดตัวอักษร

                    color: const Color.fromARGB(255, 0, 0, 0), // สีตัวอักษร
                    letterSpacing: 2.0, // ระยะห่างระหว่างตัวอักษร
                    wordSpacing: 4.0, // ระยะห่างระหว่างคำ
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
