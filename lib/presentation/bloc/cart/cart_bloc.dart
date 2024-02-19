import 'package:tr_store/domain/entities/product.dart';
import 'package:tr_store/domain/usecases/cart/add_to_cart_usecases.dart';
import 'package:tr_store/domain/usecases/cart/all_cart_product_usecases.dart';
import 'package:tr_store/domain/usecases/cart/delete_cart_usecases.dart';
import 'package:tr_store/domain/usecases/cart/update_cart_usecases.dart';
import 'package:tr_store/presentation/bloc/cart/cart_event.dart';
import 'package:tr_store/presentation/bloc/cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AllCartProductUseCase _allCartProductUseCase;
  final AddToCartUseCase _addToCartUseCase;
  final DeleteCartUsecases _deleteCartUsecases;
  final UpdateCartUsecases _updateCartUsecases;
  CartBloc(this._allCartProductUseCase, this._addToCartUseCase,
      this._deleteCartUsecases, this._updateCartUsecases)
      : super(CartLoading()) {
    _getAllCartProduct();
    _addProduct();
    _deleteCart();
    _updateProduct();
  }

  void _getAllCartProduct() {
    on<OnCartGet>((event, emit) async {
      emit(CartLoading());
      var list = await _allCartProductUseCase.execute();
      var result = list.fold<List<ProductEntity>>((l) {
        return [];
      }, (r) {
        return r;
      });
      emit(CartLoaded(result));
    });
  }

  void _deleteCart() {
    on<OnCartDelete>((event, emit) async {
      await _deleteCartUsecases.execute(event.slug);
      _getAllCartProduct();
    });
  }

  void _updateProduct() {
    on<OnCartUpdate>((event, emit) async {
      await _updateCartUsecases.execute(event.productEntity);
      _getAllCartProduct();
    });
  }

  void _addProduct() {
    on<OnCartAdd>((event, emit) async {
      await _addToCartUseCase.execute(event.productEntity);
      _getAllCartProduct();
    });
  }
}
