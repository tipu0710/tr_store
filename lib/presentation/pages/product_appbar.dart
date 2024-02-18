import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ProductAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(56);
}
