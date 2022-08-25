import 'package:ecommerce_mvvm/model/payment_method.dart';
import 'package:ecommerce_mvvm/provider/async_value_widget.dart';
import 'package:ecommerce_mvvm/provider/payment_method_provider.dart';
import 'package:ecommerce_mvvm/view/components/appbar_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/constant.dart';

class CheckoutPaymentMethodScreen extends ConsumerWidget {
  const CheckoutPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final payments = ref.watch(paymentMethodProvider);
    final selectPayment = ref.watch(selectedPaymentMethodProvider);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AppbarComponent(title: 'Choose Payment Method'),
          const SizedBox(
            height: 30,
          ),
          Flexible(
              child: AsyncValueWidget<List<PaymentMethod>>(
                  value: payments,
                  data: (data) => ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return buildCard(data[index],
                            isSelected: data[index] == selectPayment,
                            onTap: () {
                          ref
                              .read(selectedPaymentMethodProvider.notifier)
                              .update((state) => state = data[index]);
                          Navigator.pop(context);
                        });
                      })))
        ],
      )),
    );
  }

  Widget buildCard(PaymentMethod payment,
      {bool isSelected = false, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultpadding, vertical: defaultpadding / 2),
        decoration: BoxDecoration(
            color: isSelected
                ? Colors.blueAccent.shade100.withOpacity(0.4)
                : Colors.transparent,
            border: Border.all(width: 0.2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${payment.name}',
            ),
            Icon(
              isSelected
                  ? Icons.check_rounded
                  : Icons.arrow_forward_ios_rounded,
              size: 14,
            )
          ],
        ),
      ),
    );
  }
}
