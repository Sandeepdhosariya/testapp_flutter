// import 'package:flutter/material.dart';

// class Product {
//   final String title;
//   final String price;
//   final String imagePath;
//   final String? availability;
//   final Color? availabilityColor;

//   Product({
//     required this.title,
//     required this.price,
//     required this.imagePath,
//     this.availability,
//     this.availabilityColor,
//   });
// }

// class ProductsScreen extends StatefulWidget {
//   @override
//   _ProductsScreenState createState() => _ProductsScreenState();
// }

// class _ProductsScreenState extends State<ProductsScreen> {
//   List<Product> products = [
//     Product(
//       title: 'Headphones',
//       price: '\$50',
//       imagePath: 'assets/images/loginImage.png',
//     ),
//     Product(
//       title: 'Cable',
//       price: '\$10',
//       imagePath: 'assets/images/loginImage.png',
//       availability: 'In Stock',
//       availabilityColor: Colors.green,
//     ),
//   ];

//   void _removeItem(int index) {
//     setState(() {
//       products.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           final product = products[index];
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: product.availability == null
//                 ? ProductsItem(
//                     title: product.title,
//                     price: product.price,
//                     imagePath: product.imagePath,
//                     onDelete: () => _removeItem(index),
//                   )
//                 : AccessoriesItem(
//                     title: product.title,
//                     price: product.price,
//                     imagePath: product.imagePath,
//                     availability: product.availability,
//                     availabilityColor: product.availabilityColor,
//                     onDelete: () => _removeItem(index),
//                   ),
//           );
//         },
//       ),
//     );
//   }
// }

// class ProductsItem extends StatelessWidget {
//   final String title;
//   final String price;
//   final String imagePath;
//   final VoidCallback onDelete;

//   ProductsItem({
//     required this.title,
//     required this.price,
//     required this.imagePath,
//     required this.onDelete,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: 150,
//           height: 100,
//           decoration: BoxDecoration(
//             color: Colors.grey[300],
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Stack(
//             children: [
//               Center(
//                 child: Image.asset(imagePath, fit: BoxFit.cover, height: 50, width: 50),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: IconButton(
//                   icon: Icon(Icons.delete, color: Colors.black54),
//                   onPressed: onDelete,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 15),
//         Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//         Text(price, style: TextStyle(color: Colors.grey)),
//       ],
//     );
//   }
// }

// class AccessoriesItem extends StatelessWidget {
//   final String title;
//   final String price;
//   final String imagePath;
//   final String? availability;
//   final Color? availabilityColor;
//   final VoidCallback onDelete;

//   AccessoriesItem({
//     required this.title,
//     required this.price,
//     required this.imagePath,
//     this.availability,
//     this.availabilityColor,
//     required this.onDelete,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: 150,
//           height: 100,
//           decoration: BoxDecoration(
//             color: Colors.grey[300],
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Stack(
//             children: [
//               Center(
//                 child: Image.asset(imagePath, fit: BoxFit.cover),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: IconButton(
//                   icon: Icon(Icons.delete, color: Colors.black54),
//                   onPressed: onDelete,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 15),
//         Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//         Text(price, style: TextStyle(color: Colors.grey)),
//         if (availability != null)
//           Row(
//             children: [
//               CircleAvatar(
//                 radius: 4,
//                 backgroundColor: availabilityColor,
//               ),
//               SizedBox(width: 4),
//               Text(
//                 availability!,
//                 style: TextStyle(color: availabilityColor),
//               ),
//             ],
//           ),
//       ],
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';

class Product {
  final String title;
  final String price;
  final String imagePath;
  final String? availability;
  final Color? availabilityColor;

  Product({
    required this.title,
    required this.price,
    required this.imagePath,
    this.availability,
    this.availabilityColor,
  });
}

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> products = [
    Product(
      title: 'Headphones',
      price: '\$50',
      imagePath: 'assets/images/loginImage.png',
    ),
    Product(
      title: 'Cable',
      price: '\$10',
      imagePath: 'assets/images/loginImage.png',
      availability: 'In Stock',
      availabilityColor: Colors.green,
    ),
  ];

  void _removeItem(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: product.availability == null
                ? ProductsItem(
                    title: product.title,
                    price: product.price,
                    imagePath: product.imagePath,
                    onDelete: () => _removeItem(index),
                  )
                : AccessoriesItem(
                    title: product.title,
                    price: product.price,
                    imagePath: product.imagePath,
                    availability: product.availability,
                    availabilityColor: product.availabilityColor,
                    onDelete: () => _removeItem(index),
                  ),
          );
        },
      ),
    );
  }
}

class ProductsItem extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;
  final VoidCallback onDelete;

  ProductsItem({
    required this.title,
    required this.price,
    required this.imagePath,
    required this.onDelete,
  });

  ImageProvider _getImageProvider(String path) {
    if (path.startsWith('/data') ||
        path.startsWith('/storage') ||
        path.contains('/cache/')) {
      return FileImage(File(path));
    } else {
      return AssetImage(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Center(
                child: Image(
                  image: _getImageProvider(imagePath),
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(Icons.delete, color: Colors.black54),
                  onPressed: onDelete,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(price, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class AccessoriesItem extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;
  final String? availability;
  final Color? availabilityColor;
  final VoidCallback onDelete;

  AccessoriesItem({
    required this.title,
    required this.price,
    required this.imagePath,
    this.availability,
    this.availabilityColor,
    required this.onDelete,
  });

  ImageProvider _getImageProvider(String path) {
    if (path.isNotEmpty && File(path).existsSync()) {
      return FileImage(File(path));
    } else {
      return AssetImage('assets/images/default_image.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Center(
                child: Image(
                  image: _getImageProvider(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(Icons.delete, color: Colors.black54),
                  onPressed: onDelete,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(price, style: TextStyle(color: Colors.grey)),
        if (availability != null)
          Row(
            children: [
              CircleAvatar(
                radius: 4,
                backgroundColor: availabilityColor,
              ),
              SizedBox(width: 4),
              Text(
                availability!,
                style: TextStyle(color: availabilityColor),
              ),
            ],
          ),
      ],
    );
  }
}
