import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olulo_admin/blocs/blocs.dart';
import 'package:olulo_admin/config/theme.dart';
import 'package:olulo_admin/screens/menu/menu_screen.dart';

import 'package:olulo_admin/models/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc()
                ..add(
                  LoadCategories(categories: Category.categories),
                ),
        ),
        BlocProvider(
          create: (context) =>
          ProductBloc(categoryBloc: BlocProvider.of<CategoryBloc>(context))
            ..add(
              LoadProducts(products: Product.products),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'OLULO ADMIN',
        theme: theme(),
        initialRoute: '/menu',
        routes: {
          '/menu': (context) => const MenuScreen(),
        },
      ),
    );
  }
}
