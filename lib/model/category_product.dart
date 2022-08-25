import 'package:equatable/equatable.dart';

class CategoryProduct extends Equatable {
  final int? id;
  final String? category;
  final String? imageUrl;

  const CategoryProduct({this.id, this.category, this.imageUrl});

  @override
  List<Object?> get props => [id, category, imageUrl];
}

final categories = [
  CategoryProduct(
      id: 1, category: 'Shirt', imageUrl: 'assets/icons/shirt-icon.png'),
  CategoryProduct(
      id: 2, category: 'Jeans', imageUrl: 'assets/icons/jeans-icon.png'),
  CategoryProduct(
      id: 1, category: 'Shoes', imageUrl: 'assets/icons/shoes-icon.png'),
  CategoryProduct(id: 1, category: 'Hat', imageUrl: 'assets/icons/hat-icon.png')
];
