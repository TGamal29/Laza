import 'package:json_annotation/json_annotation.dart';

part 'catecory.g.dart';

@JsonSerializable()
class Category {
  final String category;

  Category({required this.category});
  factory Category.fromJson(Map<String,dynamic> json)=> _$CategoryFromJson(json);
}
