import 'package:ecommerce_mvvm/model/product.dart';
import 'package:ecommerce_mvvm/provider/cart_provider.dart';
import 'package:ecommerce_mvvm/provider/loading_provider.dart';
import 'package:ecommerce_mvvm/provider/state/loading_state.dart';
import 'package:ecommerce_mvvm/view/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCartButtonComponent extends ConsumerWidget {
  const AddCartButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectSize = ref.watch(selectedSizeProvider);
    final isloading = ref.watch(loadingProvider);

    return MyButton(
      text: 'ADD TO CART',
      isActive: (selectSize.isNotEmpty && (isloading is Finished)),
      onPressed: () {
        ref
            .read(shoppingCartProvider.notifier)
            .addToCart(ref.watch(selectedProductProvider));
      },
    );
  }
}
