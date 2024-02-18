import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        title: Image.asset(
          'assets/images/tr_store_logo.png',
          width: MediaQuery.of(context).size.width / 3,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Badge(
              label: Text('0'),
              child: Icon(CupertinoIcons.shopping_cart),
            ),
          ),
        ],
      ),
    );
  }
}
