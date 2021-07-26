import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = '/product';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ProductScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Product'),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
