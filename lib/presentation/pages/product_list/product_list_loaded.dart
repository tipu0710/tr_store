import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tr_store/domain/entities/product.dart';

class ProductListLoaded extends StatelessWidget {
  const ProductListLoaded({super.key, required this.productList});

  final List<ProductEntity> productList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 250 / 350,
      ),
      itemBuilder: (context, index) => Container(
        height: 350,
        width: 250,
        key: ValueKey(productList[index].slug),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 4),
                blurRadius: 6,
                color: Color.fromARGB(255, 235, 233, 233),
              ),
            ]),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              child: CachedNetworkImage(
                imageUrl: productList[index].thumbnail,
                width: 250,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 10),
                child: Text(
                  productList[index].title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 10),
              child: Text(
                "${productList[index].userId}৳",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffc09f40),
                ),
              ),
            ),
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
}