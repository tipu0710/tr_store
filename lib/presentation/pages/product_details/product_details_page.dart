import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_store/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:tr_store/presentation/bloc/product_details/product_details_state.dart';
import 'package:tr_store/presentation/pages/product_appbar.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductAppbar(),
      body: BlocBuilder<ProductsDetailsBloc, ProductsDetailsState>(
        builder: (context, state) {
          if (state is ProductsDetailsLoading) {
            return const Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }
          if (state is ProductsDetailsLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: CachedNetworkImage(
                        imageUrl: state.result.image,
                        width: 400,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      state.result.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "${state.result.userId}৳",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffc09f40),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        surfaceTintColor: Colors.red,
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(
                        CupertinoIcons.shopping_cart,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Add to cart",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
