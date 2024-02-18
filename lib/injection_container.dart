import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tr_store/data/data_sources/product_details_remote_data_source.dart';
import 'package:tr_store/data/data_sources/product_remote_data_source.dart';
import 'package:tr_store/data/repositories/product_details_repository_impl.dart';
import 'package:tr_store/data/repositories/product_repository_impl.dart';
import 'package:tr_store/domain/repositories/product_details_repository.dart';
import 'package:tr_store/domain/repositories/product_repositories.dart';
import 'package:tr_store/domain/usecases/get_product_details.dart';
import 'package:tr_store/domain/usecases/get_product_list.dart';
import 'package:tr_store/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:tr_store/presentation/bloc/products/products_bloc.dart';

final locator = GetIt.instance;

void setupLocator() {
  //bloc
  locator.registerFactory(() => ProductsBloc(locator()));
  locator.registerFactory(() => ProductsDetailsBloc(locator()));

  //usecases
  locator.registerLazySingleton(
      () => GetProductListUseCase(productRepositories: locator()));
  locator.registerLazySingleton(
      () => GetProductDetailsUseCase(productDetailsRepository: locator()));

  //repositories
  locator.registerLazySingleton<ProductRepositories>(
      () => ProductRepositoryImpl(productRemoteDataSources: locator()));
  locator.registerLazySingleton<ProductDetailsRepository>(
      () => ProductDetailsRepositoryImpl(productRemoteDataSources: locator()));

  //data sources
  locator.registerLazySingleton<ProductRemoteDataSources>(
      () => ProductRemoteDataSourcesImpl(dio: locator()));
  locator.registerLazySingleton<ProductDetailsRemoteDataSources>(
      () => ProductDetailsRemoteDataSourceImpl(dio: locator()));

  //external
  locator.registerLazySingleton(() => Dio());
}
