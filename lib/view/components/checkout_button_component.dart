import 'package:ecommerce_mvvm/model/cart.dart';
import 'package:ecommerce_mvvm/shared/constant.dart';
import 'package:ecommerce_mvvm/view/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/cart_provider.dart';
import 'cart_list_component.dart';

class CheckoutButtonComponent extends ConsumerWidget {
  const CheckoutButtonComponent({this.onPressed, Key? key}) : super(key: key);
  final Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(shoppingCartProvider) as List<Cart>;
    final checkoutCarts = carts
        .where((element) => element.status == CartStatus.checkout)
        .toList();

    print("[CheckoutButtonComponent] ${checkoutCarts.length}");
    if (checkoutCarts.isNotEmpty) {
      print("[CheckoutButtonComponent] ${checkoutCarts.first}");
    }

    return MyButton(
      text: 'CHECKOUT',
      isActive: carts.any((element) => element.status == CartStatus.checkout),
      onPressed: onPressed,
    );
  }
}
