import 'package:flutter/material.dart';
import 'package:tr_store/presentation/pages/helper/cart_icon.dart';

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
          child: CartIcon(),
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(56);
}
