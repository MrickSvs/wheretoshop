import 'package:flutter/material.dart';
import 'models/shop.dart';

class ShopDetailsModal extends StatelessWidget {
  final Shop shop;

  ShopDetailsModal({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                shop.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          Image.network(shop.imageUrl, height: 150, fit: BoxFit.cover),
          SizedBox(height: 10),
          Text('Description: ${shop.description}'),
          SizedBox(height: 10),
          Text('Styles: ${shop.style.join(', ')}'),
          SizedBox(height: 10),
          Text('Type: ${shop.type.join(', ')}'),
          SizedBox(height: 10),
          Text('Address: ${shop.address}'),
          SizedBox(height: 10),
          Text('Opening Hours: ${shop.openingHours}'),
          SizedBox(height: 10),
          Text('Contact: Email - ${shop.contact['email']}, Phone - ${shop.contact['phone']}'),
        ],
      ),
    );
  }
}
