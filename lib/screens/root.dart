import 'package:lualimastuff_uas/screens/cart.dart';
import 'package:lualimastuff_uas/screens/home.dart';
import 'package:lualimastuff_uas/screens/like.dart';
import 'package:lualimastuff_uas/screens/profile.dart';
import 'package:flutter/material.dart';

class ProjectRoot extends StatefulWidget {
  const ProjectRoot({super.key});

  @override
  State<ProjectRoot> createState() => _ProjectRootState();
}

class _ProjectRootState extends State<ProjectRoot> {
  int currentIndex = 0;

  List screens = [
    const HomeScreen(),
    const LikesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 118, 36, 189),
        automaticallyImplyLeading: false,
        title: const Text(
          "Lualimastuff",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Color.fromARGB(255, 118, 36, 189),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.favorite,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
