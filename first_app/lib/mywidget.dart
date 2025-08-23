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
    List<String> listProduct = ['Apple','Samsung','Oppa','Blackberry'];
    
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('List View', style: TextStyle(color: const Color.fromARGB(255, 198, 84, 149)))),
        
        centerTitle: false,
        //backgroundColor: Colors.indigo,
      ),
  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    body: ListView.separated(
      itemCount: listProduct.length,
      itemBuilder: (context, index){
        return ListTile(
          leading: Text('$index'),
          title: Text(listProduct[index]),
          subtitle: Text('glub glub glub....'),
          trailing: Image.asset(
            '01.jpg',
            height: 50,
            width: 50,
          ),
          
        );
      },
      separatorBuilder: (context, index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 1,
          width: double.infinity,
          color: Colors.purpleAccent,
        );
      },
    )
    );
  }
}
