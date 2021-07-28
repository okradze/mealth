import 'package:equatable/equatable.dart';

import 'models.dart';

class Cart extends Equatable {
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

  final List<Product> products = [
    Product(
      name: 'Soft Drink #1',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1499638673689-79a0b5115d87?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: 'Soft Drink #2',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1458945037814-389ec6994cbd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Smoothies #2',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1575159249868-df58bf5e09ec?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
      price: 5.99,
      isRecommended: false,
      isPopular: false,
    ),
  ];

  @override
  List<Object?> get props => [products];
}
