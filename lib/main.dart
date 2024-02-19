import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_store/injection_container.dart';
import 'package:tr_store/presentation/bloc/cart/cart_bloc.dart';
import 'package:tr_store/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:tr_store/presentation/bloc/products/products_bloc.dart';
import 'package:tr_store/presentation/pages/product_list/product_list_page.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<ProductsBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<ProductsDetailsBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<CartBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'TR STORE',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xffc09f40),
            primary: const Color(0xffc09f40),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            elevation: 5,
            shadowColor: Color.fromARGB(71, 232, 232, 232),
          ),
          useMaterial3: true,
        ),
        home: const ProductListPage(),
      ),
    );
  }
}
