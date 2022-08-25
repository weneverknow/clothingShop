import 'package:ecommerce_mvvm/model/address.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final List<Address>? address;

  const User({this.address, this.email, this.id, this.name, this.phone});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      address: json['address'] == null
          ? null
          : (json['address'] as List).map((e) => Address.fromJson(e)).toList());

  @override
  List<Object?> get props => [id, name, phone, email, address];
}

final users = [
  const User(
      id: 1,
      name: 'Riza',
      phone: '081',
      email: 'riza@gmail.com',
      address: [
        Address(
            street: 'Jl Apel',
            no: '100',
            city: 'Surabaya',
            state: 'Jawa Timur'),
        Address(
            street: 'Jl Jambu', no: '105', city: 'Malang', state: 'Jawa Timur')
      ])
];
