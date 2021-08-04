import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('GO TO CHECKOUT',
                    style: Theme.of(context).textTheme.headline3),
                style: ElevatedButton.styleFrom(primary: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CartDeliveryHeader(),
                      SizedBox(height: 15),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: state.cart.productQuantity.keys.length,
                          itemBuilder: (ctx, index) {
                            return CartProductCard(
                              product: state.cart.productQuantity.keys
                                  .elementAt(index),
                              quantity: state.cart.productQuantity.values
                                  .elementAt(index),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  CartTotal(),
                ],
              ),
            );
          } else {
            return Text('Something went wrong!');
          }
        },
      ),
    );
  }
}
