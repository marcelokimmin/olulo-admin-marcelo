import 'package:flutter/material.dart';
import 'package:olulo_admin/models/models.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({
    Key? key,
    required this.category,
  }) :  super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(category.imageUrl,
          height: 20),
      title: Text(
          category.name,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
      ),
      subtitle: Text(
          category.description,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
      ),
      trailing: const Icon(Icons.menu),
    );
  }
}