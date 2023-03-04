import 'package:flutter/material.dart';
import 'package:olulo_admin/config/responside.dart';
import 'package:olulo_admin/models/models.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OLULO RESTAURANT',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: Product.products.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ProductCard(
                                product: Product.products[index],
                                index: index,
                              );
                            }
                        ),
                      ),
                      const SizedBox(height: 20),
                      Responsive.isWideDesktop(context) ||
                          Responsive.isDesktop(context)
                          ? Container (
                        constraints: const BoxConstraints(
                          minHeight: 300,
                          maxHeight: 1000,
                      ),
                        child: Row(
                          children: [
                            Expanded(
                              child: _buildCategories(context),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildProducts(context),
                            )
                          ],
                        ),
                      ):
                      Column(
                        children: [
                          _buildCategories(context),

                          const SizedBox(height: 20),
                          _buildProducts(context),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(width: double.infinity,
                        constraints: const BoxConstraints(minHeight: 75),
                        color: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                        child: const Center(
                          child: Text('Some ads here'),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ),

          Responsive.isWideDesktop(context) || Responsive.isDesktop(context) ?
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                right: 20,
              ),
              color: Theme
                  .of(context)
                  .colorScheme
                  .background,
              child: const Center(child: Text('Some das here')),
            ),
          )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _buildCategories extends StatelessWidget {
  const _buildCategories(BuildContext context, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Theme
          .of(context)
          .colorScheme
          .background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categaties',
            style:
            Theme
                .of(context)
                .textTheme
                .bodyMedium,
          ),
          const SizedBox(height: 20),
          ...Category.categaties.map(
                  (category) {
                return CategoryListTile(
                  category: category,
                );
              }).toList(),
        ],
      ),
    );
  }
}

class _buildProducts extends StatelessWidget {
  const _buildProducts(BuildContext context, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Theme
          .of(context)
          .colorScheme
          .background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product',
            style:
            Theme
                .of(context)
                .textTheme
                .bodyMedium,
          ),
          const SizedBox(height: 20),
          ...Product.products.map(
                (product) {
              return ProductListTile(
                product: product,
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}

