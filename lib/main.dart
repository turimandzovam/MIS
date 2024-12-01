import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ClothingListScreen(),
    );
  }
}

class ClothingListScreen extends StatelessWidget {
  const ClothingListScreen({super.key});

  final List<Map<String, String>> clothes = const [
    {
      'name': 'T-shirt',
      'image': 'images/tshirt.png',
      'description': 'A comfortable cotton T-shirt.',
      'price': '900 DEN.',
    },
    {
      'name': 'Jeans',
      'image': 'images/jeans.png',
      'description': 'Stylish slim-fit jeans.',
      'price': '1690 DEN.',
    },
    {
      'name': 'Jacket',
      'image': 'images/jacket.png',
      'description': 'A warm winter jacket.',
      'price': '2990 DEN.',
    },
    {
      'name': 'Sneakers',
      'image': 'images/sneakers.png',
      'description': 'Comfortable running sneakers.',
      'price': '4899 DEN.',
    },
    {
      'name': 'Dress',
      'image': 'images/dress.png',
      'description': 'Elegant dress',
      'price': '3850 DEN.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('211193'),
        backgroundColor: const Color(0xFFD6C1E4),
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // dve karticki vo eden red
            childAspectRatio: 0.85, // Adjusted for proportionate card size
            crossAxisSpacing: 8.0, // prostor pomegju koloni
            mainAxisSpacing: 8.0, //prostor pomegju redovi
          ),
          itemCount: clothes.length,
          itemBuilder: (context, index) {
            final clothingItem = clothes[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ClothingDetailsScreen(clothingItem: clothingItem),
                  ),
                );
              },
              child: Card(
                color: const Color(0xEFEF95FF),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        clothingItem['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        clothingItem['name']!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        clothingItem['price']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ClothingDetailsScreen extends StatelessWidget {
  final Map<String, String> clothingItem;

  const ClothingDetailsScreen({super.key, required this.clothingItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(clothingItem['name']!),
        backgroundColor: const Color(0xFFD6C1E4),
        elevation: 4,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Image.asset(
              clothingItem['image']!,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clothingItem['name']!,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(clothingItem['description']!),
                  const SizedBox(height: 16),
                  Text(
                    'Price: ${clothingItem['price']}',
                    style: const TextStyle(fontSize: 18, color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
