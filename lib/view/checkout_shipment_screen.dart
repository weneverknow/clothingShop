import 'package:ecommerce_mvvm/model/shipment.dart';
import 'package:ecommerce_mvvm/provider/async_value_widget.dart';
import 'package:ecommerce_mvvm/provider/shipment_provider.dart';
import 'package:ecommerce_mvvm/shared/constant.dart';
import 'package:ecommerce_mvvm/view/components/appbar_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CheckoutShipmentScreen extends ConsumerWidget {
  const CheckoutShipmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shipments = ref.watch(shipmentProvider);
    final selectedShipment = ref.watch(selectedShipmentProvider);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AppbarComponent(title: 'Choose Shipment'),
          const SizedBox(
            height: 30,
          ),
          Flexible(
              child: AsyncValueWidget<List<Shipment>>(
                  value: shipments,
                  data: (data) => ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => buildCard(data[index],
                              isSelected: data[index] == selectedShipment,
                              onTap: () {
                            ref
                                .read(selectedShipmentProvider.notifier)
                                .update((state) => data[index]);
                            Navigator.pop(context);
                          }))))
        ],
      )),
    );
  }

  Widget buildCard(Shipment shipment,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${shipment.name}',
                ),
                Text(NumberFormat.currency(
                  locale: 'id_IDR',
                ).format(10000))
              ],
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
