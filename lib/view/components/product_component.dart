import 'package:ecommerce_mvvm/provider/cart_provider.dart';
import 'package:ecommerce_mvvm/provider/category_product_provider.dart';
import 'package:ecommerce_mvvm/view/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../model/product.dart';
import '../../shared/constant.dart';

class ProductComponent extends ConsumerWidget {
  const ProductComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cp = ref.watch(categoryProductProvider);
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: defaultpadding),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          maxCrossAxisExtent:
              MediaQuery.of(context).size.width - (defaultpadding * 3),
          childAspectRatio: 0.7),
      itemCount: cp == null
          ? products.length
          : products.where((element) => element.category == cp).toList().length,
      itemBuilder: (context, index) {
        final items = cp == null
            ? products
            : products.where((product) => product.category == cp).toList();
        return GestureDetector(
            onTap: () {
              ref
                  .read(selectedProductProvider.notifier)
                  .update((state) => items[index]);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailScreen(product: items[index])));
            },
            child: buildCardProduct(index, items[index]));
      },
    );
  }

  Widget buildCardProduct(int index, Product product) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.fromLTRB(
                    defaultpadding / 2, defaultpadding, defaultpadding / 2, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index.isEven
                        ? Color.fromARGB(255, 218, 212, 255)
                        : Color.fromARGB(255, 255, 217, 244)),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.network(
                    product.imageUrl!,
                    fit: BoxFit.contain,
                  ),
                ),
              )),
          Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    NumberFormat.currency(
                            locale: 'id_IDR', symbol: 'IDR', decimalDigits: 2)
                        .format(product.price),
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    product.name!,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
