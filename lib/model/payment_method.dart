import 'package:equatable/equatable.dart';

class PaymentMethod extends Equatable {
  final int? id;
  final String? name;

  const PaymentMethod({this.id, this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}

const  payments = [
  PaymentMethod(id: 1, name: 'Transfer Bank BCA'),
  PaymentMethod(id: 2, name: 'Transfer Bank BNI'),
  PaymentMethod(id: 3, name: 'Transfer Bank BRI'),
  PaymentMethod(id: 4, name: 'Transfer Bank Mandiri'),
  PaymentMethod(id: 5, name: 'Transfer Bank Syariah Indonesia')
];
