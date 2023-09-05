import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile_app/providers/shop_provider.dart';
import 'package:mobile_app/widgets/shop_details_modal.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shopProvider = Provider.of<ShopProvider>(context);
    shopProvider.fetchShops();

    return Scaffold(
      appBar: AppBar(
        title: Text('Shops Map'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(48.8566, 2.3522), // Coordonnées de Paris
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: shopProvider.shops.map((shop) {
              return Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(shop.gps['coordinates'][0], shop.gps['coordinates'][1]),
                builder: (ctx) => Container(
                  child: IconButton(
                    icon: Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ShopDetailsModal(shop: shop);
                        },
                      );
                    },
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
