import 'package:ecommerce_mvvm/model/cart.dart';
import 'package:ecommerce_mvvm/model/product.dart';
import 'package:ecommerce_mvvm/shared/constant.dart';
import 'package:ecommerce_mvvm/shared/theme.dart';
import 'package:ecommerce_mvvm/view/components/add_cart_button_component.dart';
import 'package:ecommerce_mvvm/view/components/icon_cart_component.dart';
import 'package:ecommerce_mvvm/view/widgets/my_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../provider/cart_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({required this.product, Key? key})
      : super(key: key);
  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: defaultpadding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultpadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [MyBackButton(), IconCartComponent()],
              ),
            ),
            Flexible(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        color: primarycolor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(widget.product.imageUrl!))),
                  ),
                  const SizedBox(
                    height: defaultpadding,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultpadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                            flex: 5,
                            child: Text(
                              widget.product.name!,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                            )),
                        Flexible(
                            flex: 2,
                            child: Text(
                              NumberFormat.currency(
                                      locale: 'id_IDR',
                                      symbol: 'IDR',
                                      decimalDigits: 2)
                                  .format(widget.product.price),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Consumer(builder: (context, ref, child) {
                    final selectSize = ref.watch(selectedSizeProvider);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.product.size!
                          .map((e) => GestureDetector(
                                onTap: () {
                                  ref
                                      .read(selectedSizeProvider.notifier)
                                      .update((state) => e);
                                },
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  padding:
                                      const EdgeInsets.all(defaultpadding / 2),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: defaultpadding / 2),
                                  decoration: BoxDecoration(
                                      color: selectSize == e
                                          ? primarycolor
                                          : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: primarycolor)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: selectSize == e
                                            ? Colors.white
                                            : primarycolor),
                                  ),
                                ),
                              ))
                          .toList(),
                    );
                  }),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: defaultpadding,
                        vertical: defaultpadding / 2),
                    child: Text(
                      widget.product.desc ?? '',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        margin: const EdgeInsets.fromLTRB(
            defaultpadding, 0, defaultpadding, defaultpadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).scaffoldBackgroundColor),
        child: AddCartButtonComponent(),
      ),
    );
  }
}
