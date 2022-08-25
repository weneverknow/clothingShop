import 'package:ecommerce_mvvm/model/cart.dart';
import 'package:ecommerce_mvvm/model/product.dart';
import 'package:ecommerce_mvvm/shared/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'loading_provider.dart';

final selectedSizeProvider = StateProvider.autoDispose((_) => '');
final selectedProductProvider = StateProvider((_) => Product());

class ShoppingCart extends StateNotifier<List<Cart>> {
  ShoppingCart(this.ref) : super([]);
  final Ref ref;

  Uuid uuid = Uuid();

  Future<void> addToCart(Product product) async {
    ref.read(loadingProvider.notifier).update();
    await Future.delayed(Duration(seconds: 2));

    final size =
        ref.read(selectedSizeProvider.notifier).state; //get selected size
    //print("[ShoppingCart] $product");
    state = [
      ...state,
      Cart(
          id: uuid.v4(),
          product: product,
          qty: 1,
          size: size,
          totalPrice: 1 * product.price!)
    ];
    ref.read(loadingProvider.notifier).update();
  }

  Future<void> setQty(Cart cart, int qty) async {
    state = [
      for (var item in state)
        if (item == cart)
          Cart(
              id: item.id,
              product: item.product,
              qty: (item.qty! + (qty)),
              size: item.size,
              totalPrice: (item.qty! + (qty)) * item.product!.price!,
              status: item.status)
        else
          item
    ];
  }

  Future<void> toggle(CartStatus status, Cart cart) async {
    state = [
      for (var item in state)
        if (item.id == cart.id)
          Cart(
              id: item.id,
              product: item.product,
              qty: item.qty,
              size: item.size,
              totalPrice: item.totalPrice,
              status: status)
        else
          item
    ];
  }
}

final shoppingCartProvider = StateNotifierProvider((ref) => ShoppingCart(ref));
final filteredCarts = Provider<List<Cart>?>((ref) {
  final items = ref.watch(shoppingCartProvider) as List<Cart>;
  return items
      .where((element) =>
          element.status == CartStatus.listing ||
          element.status == CartStatus.checkout)
      .toList();
});
