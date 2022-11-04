import 'package:flutter/material.dart';
import 'package:product_catalog_app/feature/auth/presentation/auth_screen.dart';
import 'package:product_catalog_app/feature/auth/presentation/provider/auth_provider.dart';
import 'package:product_catalog_app/feature/auth/presentation/provider/check_box_provider.dart';
import 'package:product_catalog_app/feature/home/presentation/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");

  runApp(MyApp(
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.token});
  final String? token;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckBoxProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Product Catalog',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: token != null ? const HomeScreen() : const AuthScreen(),
      ),
    );
  }
}
