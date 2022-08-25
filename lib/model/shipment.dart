import 'package:equatable/equatable.dart';

class Shipment extends Equatable {
  final int? id;
  final String? name;
  final int? price;

  const Shipment({this.id, this.name, this.price});

  @override
  List<Object?> get props => [id, name, price];
}

const shipments = [
  Shipment(id: 1, name: 'JNE', price: 10000),
  Shipment(id: 2, name: 'Ninja', price: 12000),
  Shipment(id: 3, name: 'Express', price: 18000)
];
