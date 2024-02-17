@GenerateMocks(
  [ProductRepositories],
  customMocks: [MockSpec<Dio>(as: #MockHttpClient)]
)
import 'package:mockito/annotations.dart';
import 'package:tr_store/domain/repositories/product_repositories.dart';
import 'package:dio/dio.dart';
