import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tr_store/data/data_sources/cart/add_to_cart_local_data_source.dart';
import 'package:tr_store/data/data_sources/cart/all_cart_product_local_data_source.dart';
import 'package:tr_store/data/data_sources/cart/cart_update_local_data_source.dart';
import 'package:tr_store/data/data_sources/cart/delete_cart_local_data_source.dart';
import 'package:tr_store/data/data_sources/product_details_remote_data_source.dart';
import 'package:tr_store/data/data_sources/product_remote_data_source.dart';
import 'package:tr_store/data/repositories/cart/add_to_cart_repository_impl.dart';
import 'package:tr_store/data/repositories/cart/all_cart_product_repository_impl.dart';
import 'package:tr_store/data/repositories/cart/cart_update_repository_impl.dart';
import 'package:tr_store/data/repositories/cart/delete_cart_repository_impl.dart';
import 'package:tr_store/data/repositories/product_details_repository_impl.dart';
import 'package:tr_store/data/repositories/product_repository_impl.dart';
import 'package:tr_store/domain/repositories/cart/add_to_cart_repositories.dart';
import 'package:tr_store/domain/repositories/cart/all_cart_product_repository.dart';
import 'package:tr_store/domain/repositories/cart/delete_cart_repository.dart';
import 'package:tr_store/domain/repositories/cart/update_cart_repository.dart';
import 'package:tr_store/domain/repositories/product_details_repository.dart';
import 'package:tr_store/domain/repositories/product_repositories.dart';
import 'package:tr_store/domain/usecases/cart/add_to_cart_usecases.dart';
import 'package:tr_store/domain/usecases/cart/all_cart_product_usecases.dart';
import 'package:tr_store/domain/usecases/cart/delete_cart_usecases.dart';
import 'package:tr_store/domain/usecases/cart/update_cart_usecases.dart';
import 'package:tr_store/domain/usecases/get_product_details.dart';
import 'package:tr_store/domain/usecases/get_product_list.dart';
import 'package:tr_store/presentation/bloc/cart/cart_bloc.dart';
import 'package:tr_store/presentation/bloc/network/network_bloc.dart';
import 'package:tr_store/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:tr_store/presentation/bloc/products/products_bloc.dart';
import 'package:tr_store/service/db.dart';

final locator = GetIt.instance;

void setupLocator() {
  //bloc
  locator.registerFactory(() => ProductsBloc(locator()));
  locator.registerFactory(() => ProductsDetailsBloc(locator()));
  locator.registerFactory(
      () => CartBloc(locator(), locator(), locator(), locator()));
  locator.registerFactory(() => NetworkBloc(locator()));

  //usecases
  locator.registerLazySingleton(
      () => GetProductListUseCase(productRepositories: locator()));
  locator.registerLazySingleton(
      () => GetProductDetailsUseCase(productDetailsRepository: locator()));
  locator.registerLazySingleton(
      () => AllCartProductUseCase(allCartProductRepository: locator()));
  locator.registerLazySingleton(
      () => AddToCartUseCase(addToCartRepository: locator()));
  locator.registerLazySingleton(
      () => UpdateCartUsecases(updateCartRepository: locator()));
  locator.registerLazySingleton(
      () => DeleteCartUsecases(deleteCartRepository: locator()));

  //repositories
  locator.registerLazySingleton<ProductRepositories>(
      () => ProductRepositoryImpl(productRemoteDataSources: locator()));
  locator.registerLazySingleton<ProductDetailsRepository>(
      () => ProductDetailsRepositoryImpl(productRemoteDataSources: locator()));
  locator.registerLazySingleton<AllCartProductRepository>(
      () => AllCartProductRepositoryImpl(allCartProductDataSource: locator()));
  locator.registerLazySingleton<AddToCartRepository>(
      () => AddToCartRepositoryImpl(addToCartLocalDataSource: locator()));
  locator.registerLazySingleton<UpdateCartRepository>(
      () => UpdateCartRepositoryImpl(cartUpdateLocalDataSource: locator()));
  locator.registerLazySingleton<DeleteCartRepository>(
      () => DeleteCartRepositoryImpl(cartDeleteLocalDataSource: locator()));

  //data sources
  locator.registerLazySingleton<ProductRemoteDataSources>(
      () => ProductRemoteDataSourcesImpl(dio: locator()));
  locator.registerLazySingleton<ProductDetailsRemoteDataSources>(
      () => ProductDetailsRemoteDataSourceImpl(dio: locator()));
  locator.registerLazySingleton<AllCartProductLocalDataSource>(
      () => AllCartProductLocalDataSourceImpl(locator()));
  locator.registerLazySingleton<AddToCartLocalDataSource>(
      () => AddToCartLocalDataSourceImpl(locator()));
  locator.registerLazySingleton<CartUpdateLocalDataSource>(
      () => UpdateCartLocalDataSourceImpl(locator()));
  locator.registerLazySingleton<CartDeleteLocalDataSource>(
      () => CartDeleteLocalDataSourceImpl(locator()));

  //external
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton(() => DbService());
  locator.registerLazySingleton(() => InternetConnectionChecker());
  locator.registerLazySingleton<Stream<InternetConnectionStatus>>(
      () => locator<InternetConnectionChecker>().onStatusChange);
}
