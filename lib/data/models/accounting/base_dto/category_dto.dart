import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/base/category.dart';

class CategoryDto extends CategoryModel {
  CategoryDto({required super.name, required super.id, required super.code, required super.withAvarez});

  factory CategoryDto.fromMap(Map<String, dynamic> map) {
    return CategoryDto(
      id: map.findAsInt('ID'),
      name: map.findAsString("Name"),
      code: map.findAsInt('Code'),
      withAvarez: map.findAsBool('WithAvarez'),
    );
  }

}
