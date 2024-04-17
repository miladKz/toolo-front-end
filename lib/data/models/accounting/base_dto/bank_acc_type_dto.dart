

import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/base/bank_acc_type.dart';

class BankAccTypeDto extends BankAccType {
  BankAccTypeDto({required super.name, required super.id});


  factory BankAccTypeDto.fromMap(Map<String, dynamic> map) {
    return BankAccTypeDto(
      id: map.findAsInt('ID'),
      name: map.findAsString("Name"),);
  }

}
