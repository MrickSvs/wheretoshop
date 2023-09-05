class Shop {
  final String id;
  final String name;
  final String description;
  final List<ShopStyle> style; // Modifié pour utiliser l'énumération ShopStyle
  final List<String> type;
  final String address;
  final Map<String, dynamic> gps;
  final Map<String, dynamic> contact;
  final String imageUrl;
  final String openingHours;
  final DateTime createdAt;
  final DateTime updatedAt;

  Shop({
    required this.id,
    required this.name,
    required this.description,
    required this.style,
    required this.type,
    required this.address,
    required this.gps,
    required this.contact,
    required this.imageUrl,
    required this.openingHours,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      style: (json['style'] as List)
          .map((item) => ShopStyle.values[int.parse(item)])
          .toList(), // Modifié pour parser les valeurs en tant que ShopStyle
      type: List<String>.from(json['type']),
      address: json['address'],
      gps: json['gps'],
      contact: json['contact'],
      imageUrl: json['imageUrl'],
      openingHours: json['openingHours'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

enum ShopStyle {
  traditional,
  modern,
  eclectic,
  other
} // Nouvelle énumération pour définir les styles possibles
