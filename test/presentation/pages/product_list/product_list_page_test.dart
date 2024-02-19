import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tr_store/domain/entities/product.dart';
import 'package:tr_store/presentation/bloc/cart/cart_bloc.dart';
import 'package:tr_store/presentation/bloc/cart/cart_event.dart';
import 'package:tr_store/presentation/bloc/cart/cart_state.dart';
import 'package:tr_store/presentation/bloc/products/products_bloc.dart';
import 'package:tr_store/presentation/bloc/products/products_event.dart';
import 'package:tr_store/presentation/bloc/products/products_state.dart';
import 'package:tr_store/presentation/pages/product_list/product_list_page.dart';

class MockProductBloc extends MockBloc<ProductsEvent, ProductsState>
    implements ProductsBloc {}

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

void main() {
  late MockProductBloc mockProductBloc;
  late MockCartBloc mockCartBloc;
  setUp(() {
    mockProductBloc = MockProductBloc();
    mockCartBloc = MockCartBloc();
    HttpOverrides.global = null;
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsBloc>(create: (_) => mockProductBloc),
        BlocProvider<CartBloc>(create: (_) => mockCartBloc),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  const testProduct = ProductEntity(
    id: 1,
    slug: "lorem-ipsum",
    url: "https://jsonplaceholder.org/posts/lorem-ipsum",
    title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    content:
        "Ante taciti nulla sit libero orci sed nam. Sagittis suspendisse gravida ornare iaculis cras nullam varius ac ullamcorper. Nunc euismod hendrerit netus ligula aptent potenti. Aliquam volutpat nibh scelerisque at. Ipsum molestie phasellus euismod sagittis mauris, erat ut. Gravida morbi, sagittis blandit quis ipsum mi mus semper dictum amet himenaeos. Accumsan non congue praesent interdum habitasse turpis orci. Ante curabitur porttitor ullamcorper sagittis sem donec, inceptos cubilia venenatis ac. Augue fringilla sodales in ullamcorper enim curae; rutrum hac in sociis! Scelerisque integer varius et euismod aenean nulla. Quam habitasse risus nullam enim. Ultrices etiam viverra mattis aliquam? Consectetur velit vel volutpat eget curae;. Volutpat class mus elementum pulvinar! Nisi tincidunt volutpat consectetur. Primis morbi pulvinar est montes diam himenaeos duis elit est orci. Taciti sociis aptent venenatis dui malesuada dui justo faucibus primis consequat volutpat. Rhoncus ante purus eros nibh, id et hendrerit pellentesque scelerisque vehicula sollicitudin quam. Hac class vitae natoque tortor dolor dui praesent suspendisse. Vehicula euismod tincidunt odio platea aenean habitasse neque ad proin. Bibendum phasellus enim fames risus eget felis et sem fringilla etiam. Integer.",
    image:
        "https://dummyimage.com/800x430/FFFFFF/lorem-ipsum.png&text=jsonplaceholder.org",
    thumbnail:
        "https://dummyimage.com/200x200/FFFFFF/lorem-ipsum.png&text=jsonplaceholder.org",
    userId: 1,
  );

  testWidgets(
    'should find the empty sizebox when there is no product available',
    (widgetTester) async {
      //arrange
      when(() => mockProductBloc.state).thenReturn(ProductsEmpty());
      when(() => mockCartBloc.state).thenReturn(const CartLoaded([]));

      //act
      await widgetTester
          .pumpWidget(makeTestableWidget(const ProductListPage()));
      var sizeBox = find.byKey(const ValueKey('empty list'));
      expect(sizeBox, findsOneWidget);
    },
  );

  testWidgets(
    'should show shimmer effect list when state is loading',
    (widgetTester) async {
      //arrange
      when(() => mockProductBloc.state).thenReturn(ProductsLoading());
      when(() => mockCartBloc.state).thenReturn(const CartLoaded([]));

      //act
      await widgetTester
          .pumpWidget(makeTestableWidget(const ProductListPage()));

      //assert
      expect(
          find.byKey(const ValueKey('product_list_loading')), findsOneWidget);
    },
  );

  testWidgets(
    'should show widget contain the key lorem-ipsum when state is loaded',
    (widgetTester) async {
      //arrange
      when(() => mockProductBloc.state)
          .thenReturn(const ProductsLoaded([testProduct]));
      when(() => mockCartBloc.state).thenReturn(const CartLoaded([]));

      //act
      await widgetTester
          .pumpWidget(makeTestableWidget(const ProductListPage()));

      //assert
      expect(find.byKey(const ValueKey('lorem-ipsum')), findsOneWidget);
    },
  );
}
