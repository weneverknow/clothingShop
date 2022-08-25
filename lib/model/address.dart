import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String? street;
  final String? no;
  final String? block;
  final String? city;
  final String? state;
  const Address({this.block, this.city, this.no, this.state, this.street});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
      street: json['street'],
      no: json['no'],
      block: json['block'],
      city: json['city'],
      state: json['state']);
  @override
  String toString() {
    // TODO: implement toString
    return '$street, No. $no | $city, $state';
  }

  @override
  List<Object?> get props => [street, no, block, city, state];
}
