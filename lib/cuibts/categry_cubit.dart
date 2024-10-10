import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/cuibts/category_state.dart';

import '../services/category_service.dart';

class CategoryCubit extends Cubit<CategoryState>{
  CategoryCubit() : super(CategoryInatial()){
    getCategory();
  }
  final CatrgoryService categoryService = CatrgoryService();
  void getCategory() async{
    emit(CategoryLoading());
    try{
      final result = await categoryService.GetCategory();

    }catch(e){
      emit(CategoryError(massage: e.toString()));
    }
}


}