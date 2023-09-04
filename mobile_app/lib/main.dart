import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/shop_provider.dart';
import 'screens/home_screen.dart'; // Assurez-vous d'importer l'écran d'accueil que vous créerez à l'étape 5

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ShopProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Définissez HomeScreen comme écran d'accueil
    );
  }
}
