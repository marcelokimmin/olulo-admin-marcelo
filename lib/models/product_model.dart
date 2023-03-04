import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final double price;
  final int index;

  const Product ({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.index,
  });

  Product copyWith ({
    String? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    double? price,
    int? index,
  }) {
    return Product(
        id: id?? this.id,
        name: name?? this.name,
        category: category?? this.category,
        description: description?? this.description,
        imageUrl: imageUrl?? this.imageUrl,
        price: price?? this.price,
        index: index?? this.index
    );
  }

  factory Product.fromSnapshot(Map<String, dynamic> snap) {
    return Product(
      id: snap['id'],
      name: snap['name'],
      category: snap['category'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      index: snap['index'],
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    category,
    description,
    imageUrl,
    price,
    index,
  ];

  static List<Product> products = const [
    Product(
        id: '1',
        name: 'Margarita',
        category: 'Pizza',
        description: 'Tomato Salsa and Queso frita',
        imageUrl: 'burger/01.jpg',
        price: 150.00,
        index: 0,
    ),
    Product(
      id: '2',
      name: 'Margarita',
      category: 'Pizza',
      description: 'Tomato Salsa and Queso frita',
      imageUrl: 'burger/02.jpg',
      price: 150.00,
      index: 1,
    ),
    Product(
        id: '3',
        name: 'Carne Salada',
        category: 'Hamburger',
        description: 'Carne de res con salsa de zanahoria',
        imageUrl: 'burger/03.jpg',
        price: 120.00,
        index: 2,
    ),
    Product(
      id: '4',
      name: 'Carne Salada',
      category: 'Hamburger',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'burger/04.jpg',
      price: 120.00,
      index: 3,
    ),
    Product(
      id: '5',
      name: 'Carne Salada',
      category: 'Hamburger',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'burger/05.jpg',
      price: 120.00,
      index: 4,
    ),
    Product(
      id: '3',
      name: 'Carne Salada',
      category: 'Hamburger',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'burger/02.jpg',
      price: 120.00,
      index: 2,
    ),
    Product(
      id: '6',
      name: 'Carne Salada',
      category: 'Hamburger',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'burger/06.jpg',
      price: 120.00,
      index: 5,
    ),
    Product(
      id: '7',
      name: 'Carne Salada',
      category: 'Hamburger',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'burger/07.jpg',
      price: 120.00,
      index: 6,
    ),
    Product(
      id: '8',
      name: 'Carne Salada',
      category: 'Hamburger',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'burger/08.jpg',
      price: 120.00,
      index: 7,
    ),
    Product(
      id: '9',
      name: 'Carne Salada',
      category: 'Hamburger',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'burger/09.jpg',
      price: 120.00,
      index: 8,
    ),
    Product(
      id: '10',
      name: 'Carne Salada',
      category: 'Hamburger',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'burger/10.jpg',
      price: 120.00,
      index: 9,
    ),
  ];
}
