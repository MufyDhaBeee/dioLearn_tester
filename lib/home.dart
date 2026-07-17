import 'package:dio_tester/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Declare the Set state variable
  final Set<int> _favoritedItemIds = {};

  void _toggleItemFavorite(int index) {
    setState(() {
      if (_favoritedItemIds.contains(index)) {
        _favoritedItemIds.remove(index);
      } else {
        _favoritedItemIds.add(index);
      }
    });
  }
final ApiService apiService = ApiService();

  // bool isFavourite = false;
 //  void toggleFavourite(){
 //    setState(() {
 //      isFavourite = !isFavourite;
 //    });
 //  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        leading: Icon(Icons.menu, color: Color.fromRGBO(69, 70, 82, 1)),
        title: Center(
          child: Text(
            'ShopMinimal',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(36, 56, 156, 1),
            ),
          ),
        ),
        actions: [Icon(Icons.search, color: Color.fromRGBO(69, 70, 82, 1))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Arrivals',
                    style: TextStyle(
                      color: Color.fromRGBO(28, 27, 27, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.filter_list_outlined,
                        color: Color.fromRGBO(36, 56, 156, 1),
                      ),
                      Text(
                        'Filter',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(36, 56, 156, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder<List<dynamic>>(
              future: apiService.fetchProductsList(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return SizedBox(
                    height: 680,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if(snapshot.hasError){
                  return SizedBox(
                    height: 680,
                    child: Text('Error : ${snapshot.error}'),
                  );
                }
                final products = snapshot.data??[];
                return SizedBox(
                  height: 680,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 5, // Spacing between columns
                      mainAxisSpacing: 5, // Spacing between rows
                      childAspectRatio: 0.5, // Aspect ratio of each item
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      final String title = product['title'] ?? 'No Title';
                      final String brand = product['brand'] ?? 'Brand';
                      final String imageUrl = product['thumbnail'] ?? '';
                      final double rating = (product['rating'] as num?)?.toDouble() ?? 0.0;
                      final double currentPrice = (product['price'] as num?)?.toDouble() ?? 0.0;
                      final double discountPercentage = (product['discountPercentage'] as num?)?.toDouble() ?? 0.0;

                      final double originalPrice = discountPercentage > 0 ? currentPrice / (1 - (discountPercentage / 100)) : currentPrice * 1.3;



                      return Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          height: 325,
                          width: 250,
                          decoration: const BoxDecoration(
                            //color: Colors.yellow,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Stack(
                                children: [
                                  Container(
                                    height: 215,
                                    width: 190,
                                    decoration: BoxDecoration(
                                      color: Colors.white54,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12), // Fixed typo here
                                      child: Image.network(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 16,
                                    right: 14,
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(252, 249, 248, 1),
                                      ),
                                      // Replaced IconButton with InkWell to fit perfectly in a 32x32 circle
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(32),
                                        onTap: () => _toggleItemFavorite(index), // Using index instead of item.id
                                        child: Icon(
                                          _favoritedItemIds.contains(index) ? Icons.favorite : Icons.favorite_border,
                                          color: _favoritedItemIds.contains(index) ? Colors.red : Colors.grey,
                                          size: 19, // Adjusted icon size to fit nicely
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Text(
                                      brand.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Color.fromRGBO(69, 70, 82, 1),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                     Text(
                                      title,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromRGBO(28, 27, 27, 1),
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                     Row(
                                      children: [
                                        Icon(Icons.star, size: 11),
                                        SizedBox(width: 5),
                                        Text(
                                          rating.toStringAsFixed(1),
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w800,
                                            color: Color.fromRGBO(69, 70, 82, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    Row(
                                      children: [
                                         Text(
                                          '\$${currentPrice.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            color: Color.fromRGBO(36, 56, 156, 1),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          '\$${originalPrice.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            color: const Color.fromRGBO(186, 26, 26, 1),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w800,
                                            decoration: TextDecoration.lineThrough,
                                            decorationColor: const Color.fromRGBO(186, 26, 26, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
