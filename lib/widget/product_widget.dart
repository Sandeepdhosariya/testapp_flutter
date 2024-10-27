import 'package:flutter/material.dart';

Widget sectionWidget({
  required String title,
  required String itemCount,
  required List<Widget> items,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              Text(
                itemCount,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Show all", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
        ),
      ),
    ],
  );
}

Widget section1Widget({
  required String title,
  required String itemCount,
  required List<Widget> items,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              Text(
                itemCount,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Show all", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
        ),
      ),
    ],
  );
}

Widget productsItemWidget({
  required String title,
  required String price,
  required IconData image,
  String? availability,
  Color? availabilityColor,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 16.0),
    child: Column(
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
                child: Icon(image, size: 40),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.delete, color: Colors.black54),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(title),
        Text(
          'Headphones',
        ),
        Text(
          price,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    ),
  );
}

Widget accessoriesItemWidget({
  required String title,
  required String price,
  required IconData image,
  String? availability,
  Color? availabilityColor,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 16.0),
    child: Column(
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
                child: Icon(image, size: 40),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.delete, color: Colors.black54),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(title),
        Text(
          price,
          style: TextStyle(color: Colors.grey),
        ),
        if (availability != null)
          Text(
            availability,
            style: TextStyle(color: availabilityColor),
          ),
      ],
    ),
  );
}
