import 'package:flutter/material.dart';

import '../model/catecory.dart';

@immutable
abstract class CategoryState {}

class CategoryInatial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> category;
  CategoryLoaded({required this.category});
}

class CategoryError extends CategoryState {
  final String massage;
  CategoryError({required this.massage});
}
