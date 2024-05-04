import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/common/abstracts/table_row_data_abs.dart';
import 'package:toolo_gostar/presentation/view_models/report_base_data_table_model.dart';

class ReportJameTarazData extends ITableRowData{
  final String accountName;
  final String accountCd;
  final double openingBalanceDebit;
  final double openingBalanceCredit;
  final double turnoverDebit;
  final double turnoverCredit;
  final double closingBalanceDebit;
  final double closingBalanceCredit;
  final double turnoverAndOpeningBalanceDebit;
  final double turnoverAndOpeningBalanceCredit;
  final double endingPeriodBalanceDebit;
  final double endingPeriodBalanceCredit;
  final double endingOpeningBalanceDebit;
  final double endingOpeningBalanceCredit;
  final double endingBalanceDebit;
  final double endingBalanceCredit;

  ReportJameTarazData({
    required this.accountName,
    required this.accountCd,
    required this.openingBalanceDebit,
    required this.openingBalanceCredit,
    required this.turnoverDebit,
    required this.turnoverCredit,
    required this.closingBalanceDebit,
    required this.closingBalanceCredit,
    required this.turnoverAndOpeningBalanceDebit,
    required this.turnoverAndOpeningBalanceCredit,
    required this.endingPeriodBalanceDebit,
    required this.endingPeriodBalanceCredit,
    required this.endingOpeningBalanceDebit,
    required this.endingOpeningBalanceCredit,
    required this.endingBalanceDebit,
    required this.endingBalanceCredit,
  }):super(id: -1,name: accountName);

  factory ReportJameTarazData.empty() {
    return ReportJameTarazData(
      accountName: '',
      accountCd: '',
      openingBalanceDebit: 0,
      openingBalanceCredit: 0,
      turnoverDebit: 0,
      turnoverCredit: 0,
      closingBalanceDebit: 0,
      closingBalanceCredit: 0,
      turnoverAndOpeningBalanceDebit: 0,
      turnoverAndOpeningBalanceCredit: 0,
      endingPeriodBalanceDebit: 0,
      endingPeriodBalanceCredit: 0,
      endingOpeningBalanceDebit: 0,
      endingOpeningBalanceCredit: 0,
      endingBalanceCredit: 0,
      endingBalanceDebit: 0,
    );
  }

  ReportJameTarazData getFieldsValue(List<String> keys) {
    final Map<String, dynamic> fieldMap = {
      'AccountName': accountName,
      'Accountcd': accountCd,
      'MablaghEbtedaBed': openingBalanceDebit,
      'MablaghEbtedaBes': openingBalanceCredit,
      'MablaghGardeshBed': turnoverDebit,
      'MablaghGardeshBes': turnoverCredit,
      'MablaghGardeshPayanBed': closingBalanceDebit,
      'MablaghGardeshPayanBes': closingBalanceCredit,
      'MablaghGardeshVaEbtedaBed': turnoverAndOpeningBalanceDebit,
      'MablaghGardeshVaEbtedaBes': turnoverAndOpeningBalanceCredit,
      'MablaghMandeDoreBed': endingPeriodBalanceDebit,
      'MablaghMandeDoreBes': endingPeriodBalanceCredit,
      'MablaghMandeEbtedaBed': endingOpeningBalanceDebit,
      'MablaghMandeEbtedaBes': endingOpeningBalanceCredit,
      "MablaghMandePayanBed": endingBalanceDebit,
      "MablaghMandePayanBes": endingBalanceCredit
    };

    for(String key in keys){
      if (fieldMap.containsKey(key)) {
        props.add('${fieldMap.findAsDynamic(key)}') ;
      } else {
        throw ArgumentError('Invalid key: $key');
      }
    }
    return this;
  }


  List<Object>  props =List.empty(growable: true);
}
