import 'package:flutter/material.dart';
import 'package:product_catalog_app/feature/home/presentation/widgets/loading.dart';
import 'package:product_catalog_app/feature/home/presentation/widgets/product_listview.dart';
import 'package:provider/provider.dart';
import 'package:product_catalog_app/feature/home/presentation/provider/product_provider.dart';
import 'package:product_catalog_app/feature/home/presentation/widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var products = Provider.of<ProductProvider>(context).products;
    setState(() {});
    return Scaffold(
      appBar: const HomeAppBar(),
      body: products == null
          ? const Loading()
          : ProductListview(products: products),
    );
  }
}
