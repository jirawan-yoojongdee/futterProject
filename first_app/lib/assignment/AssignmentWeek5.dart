import 'dart:convert';

import 'package:first_app/assignment/CreateProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Assignmentweek5 extends StatefulWidget {
  const Assignmentweek5({super.key});

  @override
  State<Assignmentweek5> createState() => _AsignmentWeek5();
}

class _AsignmentWeek5 extends State<Assignmentweek5> {
  List<useProduct> listProduct = [];
  String? selectedProductId;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var response = await http.get(
        Uri.parse('http://localhost:3000/products'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        setState(() {
          listProduct = jsonList
              .map((item) => useProduct.fromJson(item))
              .toList();
        });
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteProduct(String idDelete) async {
    try {
      var response = await http.delete(
        Uri.parse("http://localhost:3000/products/$idDelete"),
      );
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('ลบสินค้าสำเร็จ!'),
            backgroundColor: Colors.redAccent,
          ),
        );
        fetchData();
      } else {
        throw Exception("Failed to delete product");
      }
    } catch (e) {
      print(e);
    }
  }

  //ฟังก์ชันแสดง dialog เพื่อยืนยันก่อนลบ
  Future<void> confirmDeleteDialog(String productId, String productName) async {
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('ยืนยันการลบสินค้า'),
        content: Text('คุณต้องการลบ "$productName" หรือไม่?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('ยกเลิก'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('ลบ', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (result == 'OK') {
      deleteProduct(productId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 54, 108),
        title: const Text('Product'),
        actions: [
          IconButton(onPressed: fetchData, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: listProduct.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final product = listProduct[index];
                final isSelected = selectedProductId == product.id;

                return GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      selectedProductId = (isSelected
                          ? null
                          : product.id); // toggle ถังขยะ
                    });
                  },
                  child: ListTile(
                    leading: Text(product.id),
                    title: Text(
                      product.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(product.description),
                    trailing: isSelected
                        ? IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              confirmDeleteDialog(
                                product.id,
                                product.name,
                              ); // 🔹 แสดง dialog ก่อนลบ
                            },
                          )
                        : Text(
                            '${product.price.toStringAsFixed(2)} ฿',
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateProduct(),
                  ),
                ).then((value) {
                  // กลับมาหน้า list แล้วโหลดข้อมูลใหม่
                  fetchData();
                });
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 54, 108),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
              ),
              icon: const Icon(Icons.add_circle_outline, color: Colors.white),
              label: const Text(
                'Create / Update Product',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class useProduct {
  final String id;
  final String name;
  final String description;
  final double price;

  useProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory useProduct.fromJson(Map<String, dynamic> json) {
    return useProduct(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
    );
  }
}
