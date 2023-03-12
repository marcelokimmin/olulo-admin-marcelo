import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int index;

  const Category ({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.index,
  });

  Category copyWith ({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    int? index,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      index: index ?? this.index,
    );
  }

  factory Category.fromSnapshot(Map<String, dynamic> snap) {
    return Category(
      id: snap['id'],
      name: snap['name'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      index: snap['index'],
    );
  }

  @override
  List<Object?> get props => [id, name, description, imageUrl, index];

  static List<Category> categories = const [
    Category(
      id: '1',
      name: 'Pizza',
      description: 'Tomato Salsa and Queso frita',
      imageUrl: 'loging/01.png',
      index: 0,
    ),
    Category(
      id: '2',
      name: 'Hamburger',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'loging/02.png',
      index: 1,
    ),
    Category(
      id: '3',
      name: 'Carne Salada',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'loging/03.png',
      index: 2,
    ),
    Category(
      id: '4',
      name: 'Carne Salada',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'loging/04.png',
      index: 3,
    ),
    Category(
      id: '5',
      name: 'Carne Salada',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'loging/05.png',
      index: 4,
    ),
    Category(
      id: '6',
      name: 'Carne Salada',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'loging/06.png',
      index: 5,
    ),
    Category(
      id: '7',
      name: 'Carne Salada',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'loging/07.png',
      index: 6,
    ),
    Category(
      id: '8',
      name: 'Carne Salada',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'loging/08.png',
      index: 7,
    ),
    Category(
      id: '9',
      name: 'Carne Salada',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'loging/09.png',
      index: 8,
    ),
    Category(
      id: '10',
      name: 'Carne Salada',
      description: 'Carne de res con salsa de zanahoria',
      imageUrl: 'loging/10.png',
      index: 9,
    ),
  ];
}
