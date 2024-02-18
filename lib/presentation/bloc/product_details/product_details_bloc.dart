import 'package:tr_store/domain/usecases/get_product_details.dart';
import 'package:tr_store/presentation/bloc/product_details/product_details_event.dart';
import 'package:tr_store/presentation/bloc/product_details/product_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDetailsBloc
    extends Bloc<ProductsDetailsEvent, ProductsDetailsState> {
  final GetProductDetailsUseCase _getProductDetailsUseCase;
  ProductsDetailsBloc(this._getProductDetailsUseCase)
      : super(ProductsDetailsLoading()) {
    on<OnProductsDetailsGet>((event, emit) async {
      emit(ProductsDetailsLoading());
      final result = await _getProductDetailsUseCase.execute(event.id);
      result.fold((l) {
        emit(ProductsDetailsLoadFailure(l.message));
      }, (r) {
        emit(ProductsDetailsLoaded(r));
      });
    });
  }
}
