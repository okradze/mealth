import 'package:equatable/equatable.dart';

import 'models.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  Map get productQuantity {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, product) => total + product.price);
  String get subtotalString => subtotal.toStringAsFixed(2);

  double get deliveryFee => subtotal >= 30 ? 0.0 : 10.0;
  String get deliveryFeeString => deliveryFee.toStringAsFixed(2);

  double get total => subtotal + deliveryFee;
  String get totalString => total.toStringAsFixed(2);

  String get freeDeliveryString {
    if (subtotal >= 30.0) {
      return 'You have FREE delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for FREE delivery';
    }
  }

  @override
  List<Object?> get props => [products];
}
