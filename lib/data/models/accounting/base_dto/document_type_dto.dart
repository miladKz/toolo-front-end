import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/base/document_type.dart';

class DocumentTypeDto extends DocumentType {
  DocumentTypeDto(
      {required super.name,
      required super.id,
      required super.code,
      required super.description,
      required super.showInKardex});

  factory DocumentTypeDto.fromMap(Map<String, dynamic> map) {
    return DocumentTypeDto(
      id: map.findAsInt('ID'),
      name: map.findAsString("Name"),
      code: map.findAsInt("Code"),
      description: map.findAsString("Description"),
      showInKardex: map.findAsInt("ShowInKardex"),
    );
  }
}
