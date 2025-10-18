import 'package:first_app/component/custom_profile_card.dart';
import 'package:flutter/material.dart';

class SimpleCustomWidgetProfileCard extends StatelessWidget {
  const SimpleCustomWidgetProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custome Count')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomProfileCard(
              name: "Jirawan Yoojongdee",
              position: "Student",
              email: 'yoojongdee_j2@silpakorn.edu',
              phoneNumber: '092xxxxxxx',
              imageUrl: 'https://picsum.photos/id/1/300/300',
            ),
          ],
        ),
      ),
    );
  }
}



