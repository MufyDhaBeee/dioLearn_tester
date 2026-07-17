import 'package:dio_tester/bag.dart';
import 'package:dio_tester/search.dart';
import 'package:dio_tester/home.dart';
import 'package:dio_tester/profile.dart';
import 'package:flutter/material.dart';


class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  List<Widget>screens=[
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),

  ];
  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      setState(() {
        current_index = index;
      });
    }
          return Scaffold(
            body: screens[current_index],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              // onTap: (num){
              //   print("current index$num");
              //   current_index=num;
              //   setState(() {
              //   });
              // },
              onTap:  onItemTapped,
              currentIndex: current_index,
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              selectedItemColor: Color.fromRGBO(36, 56, 156, 1),
              unselectedItemColor: Color.fromRGBO(69, 70, 82, 1),

              items: [
                BottomNavigationBarItem(icon: Icon(Icons.storefront_rounded),label: 'Shop'),
                BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: 'Bag'),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline_sharp),label: 'Profile'),

              ],),


          );
        }

  }

