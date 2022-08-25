import 'package:ecommerce_mvvm/model/cart.dart';
import 'package:ecommerce_mvvm/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../shared/constant.dart';
import '../../shared/theme.dart';

final selectedCartList = StateProvider<List<Cart>>((_) => []);

class CartListComponent extends ConsumerWidget {
  const CartListComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(filteredCarts) as List<Cart>;
    return carts.isEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultpadding * 2, vertical: defaultpadding * 3),
            child: Image.network(
                'https://freepikpsd.com/file/2019/10/empty-cart-png-Transparent-Images.png'),
          )
        : ListView.builder(
            itemCount: carts.length,
            itemBuilder: (context, index) {
              return buildCard(carts[index], selectedCartList: carts,
                  onDecrement: () {
                ref
                    .read(shoppingCartProvider.notifier)
                    .setQty(carts[index], -1);
              }, onIncrement: () {
                ref.read(shoppingCartProvider.notifier).setQty(carts[index], 1);
              }, onChanged: (val) {
                bool isSelected = val ?? false;
                ref.read(shoppingCartProvider.notifier).toggle(
                    isSelected ? CartStatus.checkout : CartStatus.listing,
                    carts[index]);
              });
            });
  }

  Widget buildCard(Cart data,
      {List<Cart>? selectedCartList,
      Function(bool?)? onChanged,
      Function()? onIncrement,
      Function()? onDecrement}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultpadding / 2, vertical: defaultpadding / 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              value: (selectedCartList?.any((element) =>
                  element.id == data.id &&
                  element.status == CartStatus.checkout)),
              onChanged: onChanged),
          Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: defaultpadding / 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: primarycolor.withOpacity(0.4),
                border: Border.all(color: primarycolor, width: 0.5),
                image: DecorationImage(
                    image: NetworkImage(data.product!.imageUrl!))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                data.product!.name!,
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
                    data.size ?? '',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Text(
                NumberFormat.currency(
                        locale: 'id_IDR', symbol: 'IDR', decimalDigits: 2)
                    .format(data.product!.price),
                style: TextStyle(color: Colors.red.shade400),
              )
            ],
          ),
          Flexible(
              fit: FlexFit.tight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: onDecrement,
                      icon: Icon(
                        Icons.remove_rounded,
                        color: Colors.red,
                      )),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: defaultpadding / 4),
                    child: Text(
                      (data.qty ?? 1).toString(),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                      onPressed: onIncrement,
                      icon: Icon(
                        Icons.add_rounded,
                        color: Colors.green.shade400,
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
