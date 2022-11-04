import 'package:flutter/material.dart';
import 'package:product_catalog_app/feature/home/presentation/provider/product_provider.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = context.watch<ProductProvider>().products;

    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title: const Text(
        "PRODUCTS",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 40,
            child: Stack(
              children: [
                const Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.black,
                ),
                Positioned(
                  left: 5,
                  top: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.only(top: 5),
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          child: Text(
                            "${products?.favCount?.length}",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}