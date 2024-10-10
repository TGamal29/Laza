import 'package:dio/dio.dart';
import 'package:laza/model/catecory.dart';

class CatrgoryService{
  final _dio = Dio();
  Future GetCategory() async {
    final response = await _dio.get('https://dummyjson.com/products');
    Map<String,dynamic> jsonData = response.data;
    List<dynamic> categoryJson= jsonData['products']['category'];
    List<Category> category = categoryJson.map((json) => Category.fromJson(json as Map<String,dynamic>)).toList();
return category;
  }
}