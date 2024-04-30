import 'package:toolo_gostar/domain/entities/accounting/document/body/create_document_master_body.dart';

class CreateDocumentMasterBodyDto extends CreateDocumentMasterBody {
  CreateDocumentMasterBodyDto(
      {required super.categoryID,
      required super.number2,
      required super.numberCustom,
      required super.dateBarge,
      required super.description,
      required super.dateBargeCustom,
      required super.bargeTypeID,
      required super.numberBarge,
      required super.comment,
       super.modulesID=1});

  Map<String, dynamic> toMap() {
    return {
      "CategoryID": categoryID,
      "Number2": number2,
      "NumberCustom": numberCustom,
      "DateBarge": dateBarge,
      "Description": description,
      "DateBargeCustom": dateBargeCustom,
      "BargeTypeID": bargeTypeID,
      "NumberBarge": numberBarge,
      "Comment": comment,
      "ModulesID": modulesID
    };
  }
}
