import 'package:ecommerce_mvvm/model/product.dart';
import 'package:ecommerce_mvvm/shared/constant.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final String? id;
  final String? size;
  final Product? product;
  final int? qty;
  final int? totalPrice;
  final CartStatus? status;

  Cart(
      {this.id,
      this.size,
      this.product,
      this.qty,
      this.totalPrice,
      this.status = CartStatus.listing});

  @override
  List<Object?> get props => [id, size, product, qty, totalPrice, status];
}
