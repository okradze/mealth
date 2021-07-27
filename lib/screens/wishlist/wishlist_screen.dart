import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => WishlistScreen(),
    );
  }

  // Column(
  //       children: [
  //         Text(
  //           'Your Wishlist is empty!',
  //           style: Theme.of(context).textTheme.bodyText1,
  //         ),
  //         ElevatedButton(
  //           onPressed: () {},
  //           child: Text('Back To Shopping'),
  //           style: ElevatedButton.styleFrom(primary: Colors.black),
  //         ),
  //       ],
  // ),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.4,
        ),
        itemBuilder: (ctx, index) {
          final product = Product.products[index];
          return Center(
            child: ProductCard(
              product: product,
              widthFactor: 1.2,
              leftPosition: 100,
              isWishlist: true,
            ),
          );
        },
        itemCount: Product.products.length,
      ),
    );
  }
}
