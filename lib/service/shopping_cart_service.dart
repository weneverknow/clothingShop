import 'package:ecommerce_mvvm/model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingCartService {
  addToCart({required Product product, required String size}) {
    //proses insert to db/firestore
  }
}

final shoppingCartServiceProvider = Provider((_) => ShoppingCartService());
