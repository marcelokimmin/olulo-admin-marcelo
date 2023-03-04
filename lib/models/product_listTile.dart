import 'package:flutter/material.dart';
import 'package:olulo_admin/models/models.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    Key? key,
    required this.product,
  }) :  super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(product.imageUrl,
          height: 40,),
      title: Text(
        product.name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(
        product.description,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: const Icon(Icons.menu),
    );
  }
}