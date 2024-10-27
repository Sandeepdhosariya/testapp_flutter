


import 'package:flutter/material.dart';
import 'package:test_app/widget/items.dart';


class Section extends StatelessWidget {
  final String title;
  final String itemCount;
  final List<dynamic> items;
  final Function(int) onDelete;
  final EdgeInsets itemPadding;
  final ImageProvider<Object> Function(String path) imageProviderFunction;

  Section({
    required this.title,
    required this.itemCount,
    required this.items,
    required this.onDelete,
    this.itemPadding = const EdgeInsets.all(8.0),
    required this.imageProviderFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Text(
                "$title ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '$itemCount',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ]),
            Text('Show All' , style: TextStyle(color: Colors.blue , fontSize: 15, fontWeight: FontWeight.bold),) ,
          ],
        ),
        
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(items.length, (index) {
              final item = items[index];
              return Padding(
                padding: itemPadding,
                child: item is ProductsItem
                    ? _buildProductItem(item, index)
                    : _buildAccessoryItem(item, index),
              );
            }),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildProductItem(ProductsItem item, int index) {
    return Column(
      children: [
        Container(
          width: 150, 
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!), 
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                      child: Image(
                      image: imageProviderFunction(item.imagePath),
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),

                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.delete, color: Colors.grey),
                      onPressed: () => onDelete(index),
                    ),
                  ),
                ],
              ),

           
            ],
          ),
        ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text("Headphones", style: TextStyle(color: Colors.black)),
                Text("\$${item.price}", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        
      ],
    );
  }

  Widget _buildAccessoryItem(AccessoriesItem item, int index) {
    return Column(
      children: [
         Container(
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!), 
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8)), 
                    child: Image.asset(
                      item.imagePath, 
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.delete, color: Colors.grey),
                      onPressed: () => onDelete(index),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
              
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                 Text(
                  item.availability!,
                  style: TextStyle(color: item.availabilityColor),
                ),
                Text("${item.price}", style: TextStyle(color: Colors.grey)),
               
              ],
            ),
          ),
        
        
      
      ],
    );
  }
} 