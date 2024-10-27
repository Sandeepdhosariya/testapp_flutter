import 'dart:io';
import 'package:flutter/material.dart';
import 'package:test_app/add_products.dart';
import 'package:test_app/section_details.dart';
import 'package:test_app/widget/items.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductsItem> products = [];
  List<AccessoriesItem> accessories = [
    AccessoriesItem(
      title: "AIAIAI 3.5mm Jack 2m",
      price: "\$25.00",
      imagePath: 'assets/images/loginImage.png', 
      availability: "Available",
      availabilityColor: Colors.green,
      onDelete: () {},
    ),
    AccessoriesItem(
      title: "AIAIAI 3.5mm Jack 1.5m",
      price: "\$15.00",
      imagePath: 'assets/images/loginImage.png', 
      availability: "Unavailable",
      availabilityColor: Colors.red,
      onDelete: () {},
    ),
  ];

  void _addProduct(String title, String price, File? imagePath) {
    setState(() {
      products.add(
        ProductsItem(
          title: title,
          price: price,
          imagePath: imagePath?.path ?? '',
          onDelete: () => removeProduct(products.length - 1),
        ),
      );
    });
  }

  void removeProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  ImageProvider _getImageProvider(String path) {
    if (path.startsWith('/data') || path.startsWith('/storage') || path.contains('/cache/')) {
      return FileImage(File(path));
    } else {
      return AssetImage(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hi-Fi Shop & Service",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Audio shop on Rustaveli Ave 57.\nThis shop offers both products and services",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: 30),
                  Section(
                    title: "Products",
                    itemCount: "${products.length}",
                    items: products,
                    onDelete: removeProduct,
                    imageProviderFunction: _getImageProvider,  
                  ),
                  SizedBox(
                    height: 10,
                  ) ,
                  Section(
                    title: "Accessories",
                    itemCount: "${accessories.length}",
                    items: accessories,
                    onDelete: (index) {},
                    imageProviderFunction: _getImageProvider,  
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProductScreen(
                onAddProduct: _addProduct,
              ),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 24, 139, 234),
        child: const Icon(Icons.add),
      ),
    );
  }
}
