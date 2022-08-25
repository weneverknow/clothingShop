import 'package:ecommerce_mvvm/model/payment_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentMethodProvider
    extends StateNotifier<AsyncValue<List<PaymentMethod>>> {
  PaymentMethodProvider() : super(AsyncValue.data([])) {
    all();
  }

  Future<void> all() async {
    state = const AsyncValue.loading();
    await Future.delayed(Duration(seconds: 3));
    state = const AsyncValue.data(payments);
  }
}

final paymentMethodProvider = StateNotifierProvider<PaymentMethodProvider,
    AsyncValue<List<PaymentMethod>>>((_) => PaymentMethodProvider());
final selectedPaymentMethodProvider =
    StateProvider<PaymentMethod>((_) => payments[0]);
