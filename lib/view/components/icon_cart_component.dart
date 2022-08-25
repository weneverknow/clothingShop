import 'package:ecommerce_mvvm/view/cart_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/cart.dart';
import '../../provider/cart_provider.dart';
import '../../shared/constant.dart';
import '../../shared/theme.dart';

class IconCartComponent extends ConsumerWidget {
  const IconCartComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(filteredCarts) as List<Cart>;

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CartListScreen()));
      },
      child: Stack(
        children: [
          Icon(
            Icons.shopping_cart,
            color: primarycolor,
          ),
          carts.isEmpty
              ? const SizedBox.shrink()
              : Positioned(
                  right: 0,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: Colors.yellow.shade800, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: Text(
                      "${carts.length}",
                      style: TextStyle(fontSize: 6, color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
