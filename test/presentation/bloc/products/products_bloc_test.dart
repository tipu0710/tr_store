import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tr_store/core/error/failure.dart';
import 'package:tr_store/domain/entities/product.dart';
import 'package:tr_store/presentation/bloc/products/products_bloc.dart';
import 'package:tr_store/presentation/bloc/products/products_event.dart';
import 'package:tr_store/presentation/bloc/products/products_state.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetProductListUseCase mockGetProductListUseCase;
  late ProductsBloc productBloc;

  setUp(() {
    mockGetProductListUseCase = MockGetProductListUseCase();
    productBloc = ProductsBloc(mockGetProductListUseCase);
  });

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
  );

  test(
    'initial state should be empty',
    () {
      expect(productBloc.state, ProductsEmpty());
    }
  );
  

  blocTest<ProductsBloc,ProductsState>(
    'should emit [ProductLoading, ProductLoaded] when data is gotten successfully',
    build: () {
      when(
        mockGetProductListUseCase.execute()
      ).thenAnswer((_) async => const Right([testProduct]));
      return productBloc;
    },
    act: (bloc) => bloc.add(const OnProductsGet()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      ProductsLoading(),
      const ProductsLoaded([testProduct])
    ]
  );


  blocTest<ProductsBloc,ProductsState>(
    'should emit [ProductLoading, ProductFailure] when get data is unsuccessful',
    build: () {
      when(
        mockGetProductListUseCase.execute()
      ).thenAnswer((_) async => const Left(ServerFailure('Server failure')));
      return productBloc;
    },
    act: (bloc) => bloc.add(const OnProductsGet()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      ProductsLoading(),
      const ProductsLoadFailure('Server failure'),
    ]
  );
}
