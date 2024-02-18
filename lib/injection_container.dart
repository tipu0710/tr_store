import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tr_store/data/data_sources/product_remote_data_source.dart';
import 'package:tr_store/data/repositories/product_repository_impl.dart';
import 'package:tr_store/domain/repositories/product_repositories.dart';
import 'package:tr_store/domain/usecases/get_product_list.dart';
import 'package:tr_store/presentation/bloc/products/products_bloc.dart';

final locator = GetIt.instance;

void setupLocator() {
  //bloc
  locator.registerFactory(() => ProductsBloc(locator()));

  //usecases
  locator.registerLazySingleton(
      () => GetProductListUseCase(productRepositories: locator()));

  //repositories
  locator.registerLazySingleton<ProductRepositories>(
      () => ProductRepositoryImpl(productRemoteDataSources: locator()));

  //data sources
  locator.registerLazySingleton<ProductRemoteDataSources>(
      () => ProductRemoteDataSourcesImpl(dio: locator()));

  //external
  locator.registerLazySingleton(() => Dio());
}
