import 'package:toolo_gostar/domain/entities/common/abstracts/table_row_data_abs.dart';

class DocumentMaster extends ITableRowData {
  final String activeYear;

  ///نوع سند
  final int bargeTypeID;
  final String bargeTypeName;

  ///نوع تفکیک
  final int categoryID;
  final String categoryName;
  final String comment;
  final String dateBarge;
  final String dateBargeCustom;
  final String description;
  final bool isActive;

  //ماژول صادر کننده
  final int modulesID;
  final String modulesName;
  final bool mustBeReCreate;

  ///شمار سند
  final int number;

  ///شماره مرجع سند
  final int number2;
  final int numberBarge;
  final int numberCustom;
  final int numberDaily;
  final int numberMonthly;
  final String persianDate;
  final String persianTime;

  ///وضعیت سند
  final int saveTypeID;
  final String saveTypeName;
  final double tarazPrice;
  final double totalPrice;

  ///bestankar
  final int creditorSum;

  ///bedehkar
  final int debtorSum;
  final int remaining;

   DocumentMaster(
      {required super.id,
      required this.activeYear,
      required this.bargeTypeID,
      required this.bargeTypeName,
      required this.categoryID,
      required this.categoryName,
      required this.comment,
      required this.dateBarge,
      required this.dateBargeCustom,
      required this.description,
      required this.isActive,
      required this.modulesID,
      required this.modulesName,
      required this.mustBeReCreate,
      required this.number,
      required this.number2,
      required this.numberBarge,
      required this.numberCustom,
      required this.numberDaily,
      required this.numberMonthly,
      required this.persianDate,
      required this.persianTime,
      required this.saveTypeID,
      required this.saveTypeName,
      required this.tarazPrice,
      required this.totalPrice,
      required this.creditorSum,
      required this.debtorSum,
      required this.remaining, super.name = ''});

  @override
  List<Object?> get props => [
        number,
        numberDaily,
        numberMonthly,
        number2,
        persianDate,
        saveTypeName,
        totalPrice,
        description,
        categoryName,
        bargeTypeName,
        tarazPrice,
        modulesName,
        comment,
      ];
}
