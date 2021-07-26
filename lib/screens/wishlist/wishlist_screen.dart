import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => WishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
