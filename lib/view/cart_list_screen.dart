import 'package:ecommerce_mvvm/shared/constant.dart';
import 'package:ecommerce_mvvm/view/components/appbar_component.dart';
import 'package:ecommerce_mvvm/view/components/cart_list_component.dart';
import 'package:ecommerce_mvvm/view/components/checkout_button_component.dart';
import 'package:ecommerce_mvvm/view/confirmation_checkout_screen.dart';
import 'package:flutter/material.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarComponent(title: 'Cart'),
            Flexible(flex: 10, child: CartListComponent()),
            Flexible(
                child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultpadding),
                  child: CheckoutButtonComponent(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ConfirmationCheckoutScreen()));
                  }),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
