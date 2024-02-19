import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_store/presentation/bloc/cart/cart_bloc.dart';
import 'package:tr_store/presentation/bloc/cart/cart_state.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        int count = 0;
        if (state is CartLoading) {
          count = 0;
        }
        if (state is CartLoaded) {
          count = state.result.length;
        }
        return Badge(
          label: Text('$count'),
          child: const Icon(CupertinoIcons.shopping_cart),
        );
      },
    );
  }
}
