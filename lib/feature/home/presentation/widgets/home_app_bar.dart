import 'package:flutter/material.dart';
import 'package:product_catalog_app/feature/auth/presentation/auth_screen.dart';
import 'package:product_catalog_app/feature/home/presentation/provider/product_provider.dart';
import 'package:product_catalog_app/feature/product_fav_list/product_fav_list.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = context.watch<ProductProvider>().products;

    return AppBar(
      title: const Text(
        "PRODUCTS",
      ),
      actions: [
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductFavList(),
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 40,
              child: Stack(
                children: [
                  const Icon(
                    Icons.favorite,
                    size: 30,
                    color: Colors.white,
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
                            border: Border.all(color: Colors.blue, width: 1)),
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
          ),
        ),
        IconButton(
            onPressed: () async {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthScreen(),
                  ));

              final prefs = await SharedPreferences.getInstance();
              await prefs.remove("token");
            },
            icon: const Icon(Icons.exit_to_app)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
