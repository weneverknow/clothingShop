import 'package:ecommerce_mvvm/model/category_product.dart';
import 'package:ecommerce_mvvm/model/product.dart';
import 'package:ecommerce_mvvm/provider/category_product_provider.dart';
import 'package:ecommerce_mvvm/shared/constant.dart';
import 'package:ecommerce_mvvm/shared/theme.dart';
import 'package:ecommerce_mvvm/view/components/category_product_component.dart';
import 'package:ecommerce_mvvm/view/components/icon_cart_component.dart';
import 'package:ecommerce_mvvm/view/components/product_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultpadding, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [IconCartComponent()],
            ),
          ),
          CategoryProductComponent(),
          Padding(
            padding: const EdgeInsets.all(defaultpadding),
            child: Consumer(builder: (context, ref, child) {
              final cp = ref.watch(categoryProductProvider);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cp == null ? 'All Product' : cp.category!,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  cp == null
                      ? const SizedBox.shrink()
                      : TextButton(
                          onPressed: () {
                            ref
                                .read(categoryProductProvider.state)
                                .update((state) => null);
                          },
                          child: Text(
                            'SHOW ALL',
                            style: TextStyle(fontSize: 10),
                          ))
                ],
              );
            }),
          ),
          Flexible(child: ProductComponent())
        ],
      )),
      bottomNavigationBar:
          BottomNavigationBar(selectedItemColor: primarycolor, items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded), label: 'History'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded), label: 'Profile')
      ]),
    );
  }
}
