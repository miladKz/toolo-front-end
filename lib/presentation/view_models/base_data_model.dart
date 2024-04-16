import 'package:toolo_gostar/domain/entities/base/bank_acc_type.dart';
import 'package:toolo_gostar/domain/entities/base/bourse_type.dart';
import 'package:toolo_gostar/domain/entities/base/currency_type.dart';
import 'package:toolo_gostar/domain/entities/base/customer_data_detail.dart';
import 'package:toolo_gostar/domain/entities/base/customer_status.dart';
import 'package:toolo_gostar/domain/entities/base/detail_group_root.dart';
import 'package:toolo_gostar/domain/entities/base/document_type.dart';
import 'package:toolo_gostar/domain/entities/base/person_type.dart';
import 'package:toolo_gostar/domain/entities/base/prefix.dart';
import 'package:toolo_gostar/domain/entities/base/standard_detail.dart';

class BaseDataModel{
 final List<BankAccType> bankAccTypeList;
 final List<BourseType> bourseTypeList;
 final List<CurrencyType> currencyTypeList;
 final List<CustomerStatus> customerStatusList;
 final List<DetailGroupRoot> detailGroupRootList;
 final List<DocumentType> documentTypeList;
 final List<PersonType> personTypeList;
 final List<Prefix> prefixList;

  BaseDataModel({required this.bankAccTypeList, required this.bourseTypeList, required this.currencyTypeList, required this.customerStatusList, required this.detailGroupRootList, required this.documentTypeList, required this.personTypeList, required this.prefixList});

}