import 'package:flutter/material.dart';

class CustomProfileCard extends StatelessWidget {
  final String name;
    final String position;
    final String email;
    final String phoneNumber;
    final String imageUrl;
    
  const CustomProfileCard({
    super.key,
    required this.name,
    required this.position,
    required this.email,
    required this.phoneNumber, 
    required this.imageUrl,
  });
  
   @override
  Widget build(BuildContext context) {
    return  Container(
          height: 280,
          width: double.infinity,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 164, 107, 152),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  //color: Colors.amber,
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(image: NetworkImage(imageUrl))
                ),
              ),
              SizedBox(height: 12),
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              
              Text(
                position,
                
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              Text(
                email,
                
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              Text(
                phoneNumber,
                
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),
        
    );
  }
}
