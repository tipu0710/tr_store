import 'package:tr_store/domain/usecases/get_product_list.dart';
import 'package:tr_store/presentation/bloc/products/products_event.dart';
import 'package:tr_store/presentation/bloc/products/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductListUseCase _getProductListUseCase;
  ProductsBloc(this._getProductListUseCase) : super(ProductsEmpty()) {
    on((event, emit) async {
      emit(ProductsLoading());
      final result = await _getProductListUseCase.execute();
      result.fold((l) {
        emit(ProductsLoadFailure(l.message));
      }, (r) {
        emit(ProductsLoaded(r));
      });
    });
  }
}
