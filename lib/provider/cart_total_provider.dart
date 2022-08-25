import 'package:ecommerce_mvvm/provider/shipment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/cart.dart';
import '../shared/constant.dart';
import 'cart_provider.dart';

class ShoppingCartTotal extends StateNotifier<int> {
  ShoppingCartTotal(this.ref) : super(0) {
    getTotalPrice();
  }

  final Ref ref;

  Future<void> getTotalPrice() async {
    var carts = ref.watch(shoppingCartProvider) as List<Cart>;
    int totalPrice = 0;

    for (var item in carts) {
      if (item.status == CartStatus.checkout) {
        totalPrice += item.totalPrice ?? 0;
      }
    }

    state = totalPrice;
  }
}

final shoppingCartTotalProvider =
    StateNotifierProvider((ref) => ShoppingCartTotal(ref));
final subtotalProductProvider = Provider((ref) {
  final total = ref.watch(shoppingCartTotalProvider);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: defaultpadding / 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Subtotal Produk'),
        Text(NumberFormat.currency(
                locale: 'id_IDR', decimalDigits: 2, symbol: '')
            .format(total))
      ],
    ),
  );
});

final subtotalShipmentProvider = Provider((ref) {
  final total = ref.watch(selectedShipmentProvider);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: defaultpadding / 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Subtotal Pengiriman'),
        Text(NumberFormat.currency(
                locale: 'id_IDR', decimalDigits: 2, symbol: '')
            .format(total?.price))
      ],
    ),
  );
});

final totalPaymentProvider = Provider((ref) {
  final totalShipment = ref.watch(selectedShipmentProvider);
  final totalProduct = ref.watch(shoppingCartTotalProvider);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: defaultpadding / 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total Pembayaran',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Text(
          NumberFormat.currency(locale: 'id_IDR', decimalDigits: 2, symbol: '')
              .format((totalShipment?.price as int) + (totalProduct as int)),
          style: TextStyle(fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
});
