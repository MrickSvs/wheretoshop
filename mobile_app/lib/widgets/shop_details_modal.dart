import 'package:flutter/material.dart';
import 'package:mobile_app/models/shop.dart';

class ShopDetailsModal extends StatelessWidget {
  final Shop shop;

  const ShopDetailsModal({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                shop.name,
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          if (shop.imageUrl.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.network(
                shop.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          Text(
            'Style: ${shop.style.join(', ')}',
            style: const TextStyle(fontSize: 18.0),
          ),
          Text(
            'Description: ${shop.description}',
            style: const TextStyle(fontSize: 18.0),
          ),
          Text(
            'Type: ${shop.type.join(', ')}',
            style: const TextStyle(fontSize: 18.0),
          ),
          Text(
            'Address: ${shop.address}',
            style: const TextStyle(fontSize: 18.0),
          ),
          Text(
            'Contact: ${shop.contact}',
            style: const TextStyle(fontSize: 18.0),
          ),
          Text(
            'Opening Hours: ${shop.openingHours}',
            style: const TextStyle(fontSize: 18.0),
          ),
          // ... (ajoutez d'autres détails du magasin ici)
        ],
      ),
    );
  }
}
