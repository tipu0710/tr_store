@GenerateMocks([
  ProductRepositories,
  ProductRemoteDataSources,
], customMocks: [
  MockSpec<Dio>(as: #MockHttpClient)
])
import 'package:mockito/annotations.dart';
import 'package:tr_store/data/data_sources/product_remote_data_source.dart';
import 'package:tr_store/domain/repositories/product_repositories.dart';
import 'package:dio/dio.dart';
