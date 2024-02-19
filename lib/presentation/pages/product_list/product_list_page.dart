import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_store/presentation/bloc/products/products_bloc.dart';
import 'package:tr_store/presentation/bloc/products/products_event.dart';
import 'package:tr_store/presentation/bloc/products/products_state.dart';
import 'package:tr_store/presentation/pages/helper/product_appbar.dart';
import 'package:tr_store/presentation/pages/product_list/product_list_loaded.dart';
import 'package:tr_store/presentation/pages/product_list/product_list_loading.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductAppbar(),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const ProductListLoading();
          }
          if (state is ProductsLoaded) {
            return ProductListLoaded(
              productList: state.result,
            );
          }
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            context.read<ProductsBloc>().add(const OnProductsGet());
          });
          return const SizedBox(
            key: ValueKey('empty list'),
          );
        },
      ),
    );
  }
}
