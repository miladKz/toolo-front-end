import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/models/accounting/document/tafzili_data_dto.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master_detail.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/tafzili_data.dart';

class DocumentMasterDetailDto extends DocumentMasterDetail {
   DocumentMasterDetailDto(
      {required super.id,
      required super.accountID,
      required super.accountcd,
      required super.accountsDescription,
      required super.accountsGroupName,
      required super.accountsKolName,
      required super.article,
      required super.arzMablagh,
      required super.arzName,
      required super.arzNeshaneStr,
      required super.arzRowNumber,
      required super.description,
      required super.mablagh,
      required super.nerkhBarabari,
      required super.rowNumber,
      required super.voucherMSID,
      required super.tafziliDataList});



  factory DocumentMasterDetailDto.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> voucherDetail=map.findAsDynamic('VoucherDetail');
    return DocumentMasterDetailDto(
      id: voucherDetail.findAsInt('ID'),
      accountID: voucherDetail.findAsInt('AccountID'),
      accountcd:  voucherDetail.findAsString('Accountcd'),
      accountsDescription:  voucherDetail.findAsString('AccountsDescription'),
      accountsGroupName:  voucherDetail.findAsString('AccountsGroupName'),
      accountsKolName:  voucherDetail.findAsString('AccountsKolName'),
      article:  voucherDetail.findAsInt('Article'),
      arzMablagh:  voucherDetail.findAsDouble('ArzMablagh'),
      arzName:  voucherDetail.findAsString('ArzName'),
      arzNeshaneStr:  voucherDetail.findAsString('ArzNeshaneStr'),
      arzRowNumber:  voucherDetail.findAsInt('ArzRowNumber'),
      description:  voucherDetail.findAsString('Description'),
      mablagh:  voucherDetail.findAsDouble('Mablagh'),
      nerkhBarabari:  voucherDetail.findAsInt('NerkhBarabari'),
      rowNumber:  voucherDetail.findAsInt('RowNumber'),
      voucherMSID:  voucherDetail.findAsInt('VoucherMSID'),
      tafziliDataList:  getTafziliDataList(map),
    );
  }


  static List<TafziliData> getTafziliDataList(Map<String, dynamic> map){
    Map<String, dynamic> tafziliData = map.findAsDynamic("TafziliData");
    final itemsMap = tafziliData.findAsDynamic("Items");
    List<TafziliDataDto> tafziliDataList = List.empty(growable: true);
    for (var map in itemsMap) {
      tafziliDataList.add(TafziliDataDto.fromMap(map));
    }
    return tafziliDataList;
  }
}
