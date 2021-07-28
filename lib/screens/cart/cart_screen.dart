import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                    itemCount: Cart().products.length,
                    itemBuilder: (ctx, index) {
                      return CartProductCard(product: Cart().products[index]);
                    },
                  ),
                ),
              ],
            ),
            CartTotal(),
          ],
        ),
      ),
    );
  }
}

class CartDeliveryHeader extends StatelessWidget {
  const CartDeliveryHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Cart().freeDeliveryString,
          style: Theme.of(context).textTheme.headline5,
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

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(thickness: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('SUBTOTAL',
                      style: Theme.of(context).textTheme.headline5),
                  Text('\$${Cart().subtotalString}',
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('DELIVERY FEE',
                      style: Theme.of(context).textTheme.headline5),
                  Text('\$${Cart().deliveryFeeString}',
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              height: 60,
              color: Colors.black.withAlpha(50),
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              height: 50,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TOTAL',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white)),
                    Text('\$${Cart().totalString}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
