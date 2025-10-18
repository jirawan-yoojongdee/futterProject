import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTestCRUD extends StatefulWidget {
  const FirebaseTestCRUD({super.key});

  @override
  State<FirebaseTestCRUD> createState() => _FirebaseTestCRUDState();
}

class _FirebaseTestCRUDState extends State<FirebaseTestCRUD> {
  //CREATE: Add New Data
  Future<void> createProduct(
      String name, String description, double price) async {
    await products.add({
      'name': name,
      'description': description,
      'price': price,
    });
  }

  //Update
  Future<void> updateProduct(
      String docId, String name, String description, double price) async {
    await products.doc(docId).update({
      'name': name,
      'description': description,
      'price': price,
    });
  }

  //Delete
  Future<void> deleteProduct(String docId) async {
    await products.doc(docId).delete();
  }

  final CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Test'),
        backgroundColor: Colors.amber,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: products.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final data = snapshot.data!.docs;
          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final product = data[index];
              String productId = product.id; //  ดึงค่า ID ของเอกสาร
              return ListTile(
                leading: Text(productId),
                title: Text(product['name']),
                subtitle: Text(product['description']),
                trailing: IconButton(
                    onPressed: () {
                      deleteProduct(productId);
                    },
                    icon: const Icon(Icons.delete, color: Colors.red)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createProduct("Vivo X", "Vivo phone", 10900);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
