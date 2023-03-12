import 'package:flutter/material.dart';
import 'package:olulo_admin/models/models.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  final Category category;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(category.imageUrl, height: 40),
      title: Text(category.name, style: Theme.of(context).textTheme.bodyMedium),
      subtitle: Text(category.description,
          style: Theme.of(context).textTheme.bodyLarge),
      // trailing: const Icon(Icons.menu),
    );
  }
}
