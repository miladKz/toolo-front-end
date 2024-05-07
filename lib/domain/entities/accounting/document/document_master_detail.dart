import 'package:toolo_gostar/domain/entities/accounting/document/tafzili_data.dart';
import 'package:toolo_gostar/domain/entities/common/abstracts/table_row_data_abs.dart';

class DocumentMasterDetail extends ITableRowData {
  final int accountID;
  final String accountcd;
  final String accountsDescription;
  final String accountsGroupName;
  final String accountsKolName;
  final int article;
  final double arzMablagh;
  final String arzName;
  final String arzNeshaneStr;
  final int arzRowNumber;
  final String description;
  final double mablagh;
  final int nerkhBarabari;
  final int rowNumber;
  final int voucherMSID;
  final List<TafziliData> tafziliDataList;

  DocumentMasterDetail(
      {required super.id,
      required this.accountID,
      required this.accountcd,
      required this.accountsDescription,
      required this.accountsGroupName,
      required this.accountsKolName,
      required this.article,
      required this.arzMablagh,
      required this.arzName,
      required this.arzNeshaneStr,
      required this.arzRowNumber,
      required this.description,
      required this.mablagh,
      required this.nerkhBarabari,
      required this.rowNumber,
      required this.voucherMSID,
      required this.tafziliDataList})
      : super(name: accountsDescription);

  @override
  List<Object?> get props => [
        accountcd,
        accountsGroupName,
        description,

        ///mablagh bedehkar
        mablagh > 0 ? mablagh.abs() : 0,

        ///mablagh bestankar
        mablagh < 0 ? mablagh : 0,
        article,
        arzMablagh,
        arzName,
        nerkhBarabari,
      ];
}
