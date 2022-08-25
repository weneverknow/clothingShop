import 'category_product.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int? id;
  final String? name;
  final List<String>? size;
  final int? price;
  final CategoryProduct? category;
  final String? imageUrl;
  final String? desc;

  const Product(
      {this.id,
      this.name,
      this.size,
      this.price,
      this.category,
      this.imageUrl,
      this.desc});

  @override
  List<Object?> get props => [id, name, size, price, category, desc];
}

final products = [
  Product(
      id: 1,
      name: 'Erigo Shirt 1',
      size: ['M', 'L', 'XL'],
      price: 100000,
      category: categories[0],
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      imageUrl:
          'https://ngshope.com/pub/media/catalog/product/cache/058c0efaab55c849325697b48f66daa1/image/8103bcb2/erigo-t-shirt-soda-chill-black.png'),
  Product(
      id: 2,
      name: 'Erigo Shirt 2',
      size: ['M', 'L'],
      price: 120000,
      category: categories[0],
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      imageUrl:
          'https://ngshope.com/pub/media/catalog/product/cache/058c0efaab55c849325697b48f66daa1/image/8103b1cf/erigo-t-shirt-soda-chill-black.png'),
  Product(
      id: 3,
      name: 'Erigo Shirt 3',
      size: ['M', 'L', 'XL'],
      price: 100000,
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      category: categories[0],
      imageUrl:
          'https://ngshope.com/pub/media/catalog/product/cache/058c0efaab55c849325697b48f66daa1/image/8103bcb2/erigo-t-shirt-soda-chill-black.png'),
  Product(
      id: 4,
      name: 'Erigo Shirt 4',
      size: ['M', 'L', 'XL'],
      price: 100000,
      category: categories[0],
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      imageUrl:
          'https://ngshope.com/pub/media/catalog/product/cache/058c0efaab55c849325697b48f66daa1/image/8103b1cf/erigo-t-shirt-soda-chill-black.png'),
  Product(
      id: 5,
      name: 'Lois Jeans 1',
      size: ['32', '33', '34'],
      price: 500000,
      category: categories[1],
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      imageUrl:
          'https://www.pngmart.com/files/7/Denim-Jean-PNG-Free-Download.png'),
  Product(
      id: 6,
      name: 'Lois Jeans 2',
      size: ['32', '33', '34'],
      price: 500000,
      category: categories[1],
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      imageUrl:
          'https://www.pngmart.com/files/7/Denim-Jean-PNG-Free-Download.png'),
  Product(
      id: 7,
      name: 'Lois Jeans 3',
      size: ['32', '33', '34'],
      price: 500000,
      category: categories[1],
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      imageUrl:
          'https://www.pngmart.com/files/7/Denim-Jean-PNG-Free-Download.png'),
  Product(
      id: 8,
      name: 'Airwalk Shoes 1',
      size: ['41', '42', '43', '44'],
      price: 300000,
      category: categories[2],
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/55117ea5e4b0adc81e800fe2/1523564992683-TVFKZPQ5EP6W089M88N0/static1.squfafafarespace+copy.png'),
  Product(
      id: 9,
      name: 'Airwalk Shoes 2',
      size: ['41', '42', '43', '44'],
      price: 300000,
      category: categories[2],
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/55117ea5e4b0adc81e800fe2/1523565564836-2OWP4MMCT64G4G1263YV/image-asset.png'),
  Product(
      id: 10,
      name: 'Airwalk Shoes 3',
      size: ['41', '42', '43', '44'],
      price: 300000,
      category: categories[2],
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/55117ea5e4b0adc81e800fe2/1523565564836-2OWP4MMCT64G4G1263YV/image-asset.png'),
  Product(
      id: 11,
      name: 'Airwalk Shoes 4',
      size: ['41', '42', '43', '44'],
      price: 300000,
      category: categories[2],
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/55117ea5e4b0adc81e800fe2/1523564992683-TVFKZPQ5EP6W089M88N0/static1.squfafafarespace+copy.png'),
  Product(
      id: 12,
      name: 'Fedora Hat 1',
      size: ['M', 'L'],
      price: 80000,
      category: categories[3],
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      imageUrl:
          'https://www.pngmart.com/files/3/Fedora-Transparent-Background.png'),
  Product(
      id: 13,
      name: 'Fedora Hat 2',
      size: ['M', 'L'],
      price: 90000,
      category: categories[3],
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      imageUrl:
          'https://www.pngmart.com/files/3/Fedora-Transparent-Background.png'),
  Product(
      id: 14,
      name: 'Fedora Hat 3',
      size: ['M', 'L'],
      price: 100000,
      category: categories[3],
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      imageUrl:
          'https://www.pngmart.com/files/3/Fedora-Transparent-Background.png'),
];
