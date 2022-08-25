import 'package:ecommerce_mvvm/model/cart.dart';
import 'package:ecommerce_mvvm/provider/cart_provider.dart';
import 'package:ecommerce_mvvm/provider/payment_method_provider.dart';
import 'package:ecommerce_mvvm/provider/shipment_provider.dart';
import 'package:ecommerce_mvvm/provider/user_provider.dart';
import 'package:ecommerce_mvvm/shared/constant.dart';
import 'package:ecommerce_mvvm/view/checkout_payment_method_screen.dart';
import 'package:ecommerce_mvvm/view/checkout_shipment_screen.dart';
import 'package:ecommerce_mvvm/view/components/appbar_component.dart';
import 'package:ecommerce_mvvm/view/components/cart_list_component.dart';
import 'package:ecommerce_mvvm/view/components/confirmation_button_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../provider/cart_total_provider.dart';
import '../shared/theme.dart';

class ConfirmationCheckoutScreen extends StatefulWidget {
  const ConfirmationCheckoutScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmationCheckoutScreen> createState() =>
      _ConfirmationCheckoutScreenState();
}

class _ConfirmationCheckoutScreenState
    extends State<ConfirmationCheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AppbarComponent(title: 'Checkout Confirmation'),
          Flexible(
              child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultpadding, vertical: defaultpadding / 2),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300)),
                child: Consumer(builder: (context, ref, child) {
                  final user = ref.watch(userProvider.notifier).state;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alamat Pengiriman',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(user!.name! + ' | ' + user.phone!),
                      Text(user.address![0].toString())
                    ],
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultpadding, vertical: defaultpadding / 2),
                child: Text(
                  'Item (s)',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Consumer(builder: (context, ref, child) {
                var items = ref.watch(shoppingCartProvider.notifier).state;
                items = items
                    .where((item) => item.status == CartStatus.checkout)
                    .toList();
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultpadding),
                  child: Column(
                    children: items
                        .map(
                          (item) => buildItemCard(item),
                        )
                        .toList(),
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultpadding, vertical: defaultpadding / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Consumer(builder: (context, ref, child) {
                      return Text(
                        NumberFormat.currency(
                                locale: 'id_IRD',
                                symbol: 'IDR',
                                decimalDigits: 2)
                            .format(ref.watch(shoppingCartTotalProvider)),
                        style: TextStyle(fontWeight: FontWeight.w600),
                      );
                    })
                  ],
                ),
              ),
              Container(
                height: 5,
                color: Colors.black.withOpacity(0.2),
              ),
              Container(
                color: primarycolor.withOpacity(0.09),
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultpadding, vertical: defaultpadding / 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipping',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Consumer(builder: (context, ref, child) {
                      final ship = ref.watch(selectedShipmentProvider);
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text("${ship?.name}"),
                        subtitle: Text(NumberFormat.currency(locale: 'id_IDR')
                            .format(ship?.price)),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CheckoutShipmentScreen()));
                        },
                      );
                    })
                  ],
                ),
              ),
              Container(
                height: 5,
                color: Colors.black.withOpacity(0.2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultpadding, vertical: defaultpadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Consumer(builder: (context, ref, child) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                            "${ref.watch(selectedPaymentMethodProvider).name}"),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  CheckoutPaymentMethodScreen()));
                        },
                      );
                    })
                  ],
                ),
              ),
              Container(
                height: 0.8,
                color: Colors.black.withOpacity(0.2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultpadding, vertical: defaultpadding / 2),
                child: Consumer(builder: (context, ref, child) {
                  final subtotalProduct = ref.watch(subtotalProductProvider);
                  final subtotalShipment = ref.watch(subtotalShipmentProvider);
                  final total = ref.watch(totalPaymentProvider);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rincian Pembayaran',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtotalProduct,
                      subtotalShipment,
                      total
                    ],
                  );
                }),
              ),
            ],
          ))
        ],
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultpadding, vertical: defaultpadding / 2),
        child: ConfirmationButtonComponent(),
      ),
    );
  }

  Padding buildLabel(String label, String value, {bool isbold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultpadding / 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label',
            style: TextStyle(
                fontWeight: isbold ? FontWeight.w600 : FontWeight.normal),
          ),
          Text(
            value,
            style: TextStyle(
                fontWeight: isbold ? FontWeight.w600 : FontWeight.normal),
          )
        ],
      ),
    );
  }

  Widget buildItemCard(Cart item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultpadding / 2),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.only(right: defaultpadding / 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: primarycolor.withOpacity(0.4),
                border: Border.all(color: primarycolor, width: 0.5),
                image: DecorationImage(
                    image: NetworkImage(item.product!.imageUrl!))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                item.product!.name ?? '',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    'Size',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(
                    width: defaultpadding / 4,
                  ),
                  Text(
                    item.size ?? '',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Text(
                NumberFormat.currency(
                        locale: 'id_IDR', symbol: 'IDR', decimalDigits: 2)
                    .format(item.product!.price),
                style: TextStyle(color: Colors.red.shade400),
              )
            ],
          ),
          Flexible(
              child: Align(
            alignment: Alignment.bottomRight,
            child: Text('x ${item.qty}'),
          ))
        ],
      ),
    );
  }
}
