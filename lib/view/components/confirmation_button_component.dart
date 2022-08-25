import 'package:ecommerce_mvvm/model/cart.dart';
import 'package:ecommerce_mvvm/provider/cart_provider.dart';
import 'package:ecommerce_mvvm/shared/constant.dart';
import 'package:ecommerce_mvvm/view/confirmation_checkout_success_screen.dart';
import 'package:ecommerce_mvvm/view/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmationButtonComponent extends ConsumerWidget {
  const ConfirmationButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(shoppingCartProvider) as List<Cart>;
    return MyButton(
      text: 'CONFIRMATION',
      isActive: true,
      onPressed: () {
        for (var item in carts) {
          if (item.status == CartStatus.checkout) {
            print("[ConfirmationButtonComponent] $item");
            ref
                .read(shoppingCartProvider.notifier)
                .toggle(CartStatus.confirmed, item);
          }
        }

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ConfirmationCheckoutSuccessScreen()));
      },
    );
  }
}
