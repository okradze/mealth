import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is StartCart) {
      yield* _mapStartCartToState();
    } else if (event is AddCartProduct) {
      yield* _mapAddCartProductToState(event, state);
    } else if (event is RemoveCartProduct) {
      yield* _mapRemoveCartProductToState(event, state);
    }
  }

  Stream<CartState> _mapStartCartToState() async* {
    yield CartLoading();
    try {
      await Future.delayed(Duration(seconds: 2));
      yield CartLoaded();
    } catch (e) {
      yield CartError();
    }
  }

  Stream<CartState> _mapAddCartProductToState(
    AddCartProduct event,
    CartState state,
  ) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
          cart: Cart(
            products: List.from(state.cart.products)..add(event.product),
          ),
        );
      } catch (e) {
        yield CartError();
      }
    }
  }

  Stream<CartState> _mapRemoveCartProductToState(
    RemoveCartProduct event,
    CartState state,
  ) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
          cart: Cart(
            products: List.from(state.cart.products)..remove(event.product),
          ),
        );
      } catch (e) {
        yield CartError();
      }
    }
  }
}
