part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class Categotyloading extends CategoryState {}

class Categotyloaded extends CategoryState {
  final List<Category> categories;
  final Category? selectedCategory;

  const Categotyloaded(
      {this.categories = const <Category>[],
        this.selectedCategory,});

  @override
  List<Object?> get props => [categories, selectedCategory];
}