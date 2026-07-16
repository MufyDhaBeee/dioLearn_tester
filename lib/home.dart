import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            SizedBox(
              height: 680,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 2, // Spacing between columns
                  mainAxisSpacing: 2, // Spacing between rows
                  childAspectRatio: 0.6, // Aspect ratio of each item
                ),
                itemCount: 16,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 325,
                      width: 250,
                      decoration: BoxDecoration(
                        // color: Colors.yellow,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Container(
                            height: 220,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(12),
                              child: Image.asset(
                                'assets/images/watch.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'LUMINA ESSENTIALS',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color.fromRGBO(69, 70, 82, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'Classic Watch',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(28, 27, 27, 1),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Row(
                                  children: [
                                    Icon(Icons.star, size: 11),
                                    SizedBox(width: 5),
                                    Text(
                                      '4.8',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w800,
                                        color: Color.fromRGBO(69, 70, 82, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 3),
                                Row(
                                  children: [
                                    Text(
                                      '\$28.00',
                                      style: TextStyle(
                                        color: Color.fromRGBO(36, 56, 156, 1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '\$45.00',
                                      style: TextStyle(
                                        color: Color.fromRGBO(186, 26, 26, 1),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w800,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Color.fromRGBO(
                                          186,
                                          26,
                                          26,
                                          1,
                                        ),
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
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
