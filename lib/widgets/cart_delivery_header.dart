import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';

class CartDeliveryHeader extends StatelessWidget {
  const CartDeliveryHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoaded) {
              return Text(
                state.cart.freeDeliveryString,
                style: Theme.of(context).textTheme.headline5,
              );
            } else {
              return Text('Something went wrong');
            }
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            shape: RoundedRectangleBorder(),
            elevation: 0,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(HomeScreen.routeName);
          },
          child: Text(
            'Add More Items',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white),
          ),
        )
      ],
    );
  }
}
