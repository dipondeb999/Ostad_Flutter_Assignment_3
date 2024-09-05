import 'package:flutter/material.dart';
import 'package:ostad_flutter_assignment_3/presentation/screens/add_cart_screen.dart';

class CartItemsApp extends StatelessWidget {
  const CartItemsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffE5E5E5),
          elevation: 0,
        ),
        scaffoldBackgroundColor: const Color(0xffE5E5E5),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const AddCartScreen(),
    );
  }
}
