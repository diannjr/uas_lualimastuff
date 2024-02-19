import 'package:lualimastuff_uas/data/all_products.dart';
import 'package:lualimastuff_uas/modal/product.dart';
import 'package:lualimastuff_uas/screens/details.dart';
import 'package:lualimastuff_uas/widget/categories.dart';
import 'package:lualimastuff_uas/widget/product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isCategorySelected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                SizedBox(width: 16),
                Icon(Icons.search),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Categories",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          buildProductCategory(),
          const SizedBox(height: 16),
          const Text(
            "New Products",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: buildAllProducts(),
          ),
        ],
      ),
    );
  }
}

buildProductCategory() {
  return SizedBox(
    height: 100,
    width: 200,
    child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: const [
        CategoryCard(
          image: "assets/shoes/shoes3.png",
          title: "Shoes",
          tag: "shoes",
          index: 0,
        ),
        CategoryCard(
          image: "assets/tshirt/tshirt5.png",
          title: "Tshirt",
          tag: "tshirt",
          index: 1,
        ),
        CategoryCard(
          image: "assets/jacket/jacket2.png",
          title: "Jacket",
          tag: "jacket",
          index: 2,
        ),
        CategoryCard(
          image: "assets/images/background.jpg",
          title: "Others",
          tag: "others",
          index: 3,
        ),
      ],
    ),
  );
}

Widget buildAllProducts() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: (100 / 140),
      ),
      scrollDirection: Axis.vertical,
      itemCount: AllProducts.allProducts.length,
      itemBuilder: ((context, index) {
        final Product allProduct = AllProducts.allProducts[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(
                  product: allProduct,
                ),
              ),
            );
          },
          child: ProductCard(product: allProduct),
        );
      }),
    );
