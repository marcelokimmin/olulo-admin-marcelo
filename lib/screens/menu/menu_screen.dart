import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olulo_admin/blocs/blocs.dart';
import 'package:olulo_admin/config/responside.dart';

import '../../models/category_listTile.dart';
import '../../models/custom_appbar.dart';
import '../../models/custom_drawer.dart';
import '../../models/product_card.dart';
import '../../models/product_listTile.dart';
import '../../models/product_model.dart';

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
                            }),
                      ),
                      const SizedBox(height: 20),
                      Responsive.isWideDesktop(context) ||
                          Responsive.isDesktop(context)
                          ? Container(
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
                      )
                          : Column(
                        children: [
                          _buildCategories(context),
                          const SizedBox(height: 20),
                          _buildProducts(context),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
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
              )),
          Responsive.isWideDesktop(context) || Responsive.isDesktop(context)
              ? Expanded(
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

// class _buildCategories extends StatelessWidget {
//   const _buildCategories(BuildContext context, {
//     super.key,
//   });
//
//   @override
Container _buildProducts(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(20.0),
    color: Theme
        .of(context)
        .colorScheme
        .background,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Products',
          style: Theme
              .of(context)
              .textTheme
              .bodyMedium,
        ),
        BlocBuilder<ProductBloc, ProductState>
          (builder: (context, state) {
          if (state is ProductLoading) {
            return Center(
                child: CircularProgressIndicator(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                )
            );
          }
          if (state is ProductLoaded) {
            return
              ReorderableListView(
                  shrinkWrap: true,
                  children: [
                    for (int index = 0;
                    index < state.products.length;
                    index++, )
                      ProductListTile(
                        product: state.products[index],
                        onTap: () {
                          // Click to select the category
                        },
                        key: ValueKey(state.products[index].id),
                      ),
                  ],
                  onReorder: (oldIndex, newIndex) {
                    context.read<ProductBloc>().add(
                      SortProducts(
                        oldIndex: oldIndex,
                        newIndex: newIndex,
                      ),
                    );
                  });
          } else {
            return const Text('Something went wrong');
          }
        },
        ),

        // ...Product.products.map((product) {
        //   return ProductListTile(
        //     product: product,
        //   );
        // }).toList(),
      ],
    ),
  );
}

// class _buildProducts extends StatelessWidget {
//   const _buildProducts(BuildContext context, {
//     super.key,
//   });
//
//   @override
Container _buildCategories(BuildContext context) {
  return
    Container(
      color: Theme
          .of(context)
          .colorScheme
          .background,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Categories',
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium,
          ),


          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
            if (state is CategoryLoading) {
              return Center(
                  child: CircularProgressIndicator(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                  )
              );
            }
            if (state is CategoryLoaded) {
              return
                ReorderableListView(
                    shrinkWrap: true,
                    children: [
                      for (int index = 0; index <
                          state.categories.length; index++, )
                        CategoryListTile(
                          category: state.categories[index],
                          onTap: () {
                            context
                                .read<CategoryBloc>()
                                .add(SelectCategory(state.categories[index]));
                        },
                          key: ValueKey(state.categories[index].id),
                        ),
                    ],
                    onReorder: (oldIndex, newIndex) {
                      context.read<CategoryBloc>().add(
                        SortCategories(
                          oldIndex: oldIndex,
                          newIndex: newIndex,
                        ),
                      );
                    });
            } else {
              return const Text('Something went wrong');
            }
          },
          ),
        ],
      ),
    );
  }