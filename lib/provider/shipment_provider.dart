import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/shipment.dart';

class ShipmentProvider extends StateNotifier<AsyncValue<List<Shipment>>> {
  ShipmentProvider() : super(const AsyncValue.data([])) {
    all();
  }

  Future<void> all() async {
    state = const AsyncValue.loading();
    await Future.delayed(Duration(seconds: 3));
    state = const AsyncValue.data(shipments);
  }
}

final shipmentProvider =
    StateNotifierProvider<ShipmentProvider, AsyncValue<List<Shipment>>>(
        (ref) => ShipmentProvider());
final selectedShipmentProvider = StateProvider<Shipment?>((_) => shipments[0]);
