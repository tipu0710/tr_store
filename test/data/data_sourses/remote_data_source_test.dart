import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tr_store/core/constants/constants.dart';
import 'package:tr_store/core/error/exception.dart';
import 'package:tr_store/data/data_sources/product_remote_data_source.dart';
import 'package:tr_store/data/models/product_model.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late ProductRemoteDataSourcesImpl productRemoteDataSourcesImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    productRemoteDataSourcesImpl =
        ProductRemoteDataSourcesImpl(dio: mockHttpClient);
  });

  group('get product list', () {
    test('should return 200 when status code is 200', () async {
      // arrange
      when(mockHttpClient.post(Url.getProducts())).thenAnswer(
        (realInvocation) async => Response(
          data: [getJson('helpers/dummy_data/dummy_product_response.json')],
          statusCode: 200,
          requestOptions: RequestOptions(),
        ),
      );

      //act
      final result = await productRemoteDataSourcesImpl.getProducts();

      //assert
      expect(result, isA<List<ProductModel>>());
    });

    test(
        'should throw a server exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.post(Url.getProducts())).thenAnswer(
        (realInvocation) async => Response(
          data: 'not found',
          statusCode: 404,
          requestOptions: RequestOptions(),
        ),
      );

      //act
      final result = productRemoteDataSourcesImpl.getProducts();

      //assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
