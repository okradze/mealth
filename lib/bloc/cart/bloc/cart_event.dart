part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class StartCart extends CartEvent {}

class AddCartProduct extends CartEvent {
  final Product product;

  const AddCartProduct({required this.product});

  @override
  List<Object> get props => [product];
}

class RemoveCartProduct extends CartEvent {
  final Product product;

  const RemoveCartProduct({required this.product});

  @override
  List<Object> get props => [product];
}
