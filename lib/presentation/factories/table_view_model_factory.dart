import 'package:toolo_gostar/domain/entities/accounting/account_with_tafzili_group.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master_detail.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/balance_and_ledgers.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/balance_and_ledgers_report.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_Taraz_Tafzili_group_data.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_Taraz_Tafzili_shenavar_hesab_data.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_jame_taraz_data.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_taraz_tafzili_group.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_taraz_tafzili_shenavar_hesab.dart';
import 'package:toolo_gostar/domain/entities/base/available_bank_.dart';
import 'package:toolo_gostar/domain/entities/base/standard_detail.dart';
import 'package:toolo_gostar/domain/entities/common/bank_in_selective_modal.dart';
import 'package:toolo_gostar/domain/entities/common/counterparty.dart';
import 'package:toolo_gostar/domain/entities/common/people.dart';
import 'package:toolo_gostar/main.dart';

import '../../domain/entities/accounting/reports/report_Taraz_Tafzili_shenavar_data.dart';
import '../../domain/entities/accounting/reports/report_jame_taraz.dart';
import '../../domain/entities/accounting/reports/report_taraz_tafzili_shenavar.dart';
import '../../domain/entities/base/detail_group_root.dart';
import '../../domain/entities/common/bank.dart';
import '../../domain/entities/common/card_reader.dart';
import '../../domain/entities/common/cash_box.dart';
import '../../domain/entities/common/city.dart';
import '../../domain/entities/common/revolving_fund.dart';
import '../view_models/table_view_model.dart';

class DataTableViewModelFactory {
  static DataTableViewModel createTableViewModelFromCityList(
      List<City> cities) {
    final List<String> labels = [
      localization.code,
      localization.province,
      localization.city
    ];

    return DataTableViewModel(labels: labels, data: cities);
  }

  static DataTableViewModel createTableViewModelFromAccountingDocumentMaster(
      {required List<DocumentMaster> documentMaster}) {
    final List<String> labels = [
      localization.titleReference,
      localization.titleDaily,
      localization.titleMonthly,
      localization.titleDocument,
      localization.titleDocumentDate,
      localization.status,
      localization.titleSumTotal,
      localization.titleDetailDocument,
      localization.titleSeparationType,
      localization.titleDocumentType,
      localization.titleCeilingNumber,
      localization.titleExporterModule,
      localization.titleNote,
    ];

    return DataTableViewModel(labels: labels, data: documentMaster);
  }

  static DataTableViewModel
      createTableViewModelFromAccountingDocumentMasterDetail({
    required List<DocumentMasterDetail> documentMasterDetail,
  }) {
    final List<String> labels = [
      localization.accountCode,
      localization.titleAccountName,
      localization.titleDetailRow,
      localization.titleDebtorAmount,
      localization.titleCreditorAmount,
      localization.titleArticle,
      localization.titleCurrencyAmount,
      localization.titleCurrencyType,
      localization.titleExchangeParity,
    ];

    return DataTableViewModel(labels: labels, data: documentMasterDetail);
  }

  static DataTableViewModel createTableViewModelFromPersonList(
      List<Counterparty> counterParties) {
    final List<String> labels = [
      localization.code,
      localization.titleNikName,
      localization.name,
      localization.nationalId
    ];
    List<People> peopleList = List.empty(growable: true);

    for (Counterparty counterparty in counterParties) {
      peopleList.add(People(counterparty: counterparty));
    }

    return DataTableViewModel(labels: labels, data: peopleList);
  }

  static DataTableViewModel createTableViewModelFromBankList(
      List<Counterparty> counterParties) {
    final List<String> labels = [
      localization.titleBankName,
      localization.code,
      localization.name,
      localization.titleCurrencyType
    ];

    final List<Bank> bankList = List.empty(growable: true);

    for (Counterparty counterparty in counterParties) {
      bankList.add(Bank(counterparty: counterparty));
    }
    return DataTableViewModel(labels: labels, data: bankList);
  }

  static DataTableViewModel createTableViewModelFromCardReaderList(
      List<Counterparty> counterParties) {
    final List<String> labels = [
      localization.code,
      localization.name,
      localization.titleCurrencyType,
      localization.description
    ];

    final List<CardReader> cardReaders = List.empty(growable: true);

    for (Counterparty counterparty in counterParties) {
      cardReaders.add(CardReader(counterparty: counterparty));
    }

    return DataTableViewModel(labels: labels, data: cardReaders);
  }

  static DataTableViewModel createTableViewModelFromRevolvingFund(
      List<Counterparty> counterpartyList) {
    final List<String> labels = [
      localization.code,
      localization.name,
      localization.titleCurrencyType,
      localization.explanation,
      localization.revolvingFundType,
      localization.revolvingFundLimit
    ];

    final List<RevolvingFund> revolvingFundList = List.empty(growable: true);

    for (Counterparty counterparty in counterpartyList) {
      revolvingFundList.add(RevolvingFund(counterparty: counterparty));
    }

    return DataTableViewModel(labels: labels, data: revolvingFundList);
  }

  static DataTableViewModel createTableViewModelFromCashBoxList(
      List<Counterparty> counterParties) {
    final List<String> labels = [
      localization.code,
      localization.name,
      localization.titleCurrencyType,
      localization.description
    ];

    final List<CashBox> cashBoxList = List.empty(growable: true);

    for (Counterparty counterparty in counterParties) {
      cashBoxList.add(CashBox(counterparty: counterparty));
    }

    return DataTableViewModel(labels: labels, data: cashBoxList);
  }

  static DataTableViewModel createTableViewModelFromBankAccTypeList(
      List<Counterparty> counterParties) {
    final List<String> labels = [
      localization.code,
      localization.name,
    ];
    final List<BankInSelectiveModal> bankList = List.empty(growable: true);

    for (Counterparty counterparty in counterParties) {
      bankList.add(BankInSelectiveModal(counterparty: counterparty));
    }
    return DataTableViewModel(labels: labels, data: bankList);
  }

  static DataTableViewModel createTableViewModelFromAvailableBankList(
      List<AvailableBank> availableBankList) {
    final List<String> labels = [localization.name];
    return DataTableViewModel(labels: labels, data: availableBankList);
  }

  static DataTableViewModel createTableViewModelFromStandardDetailList(
      List<StandardDetail> standardDetailList) {
    final List<String> labels = [localization.explanation];
    return DataTableViewModel(labels: labels, data: standardDetailList);
  }

  static DataTableViewModel createTableViewModelFromAccountHaveTafziliGroup(
      {required List<AccountHaveTafziliGroup> accountList}) {
    final List<String> labels = [
      localization.code,
      localization.name,
      localization.description
    ];

    return DataTableViewModel(labels: labels, data: accountList);
  }

  static DataTableViewModel? createTableViewModelFromReportTDP(
      {required BalanceAndLedgersReport balanceAndLedgersReport}) {
    List<BalanceAndLedgers> values = List.empty(growable: true);
    final List<String> keys = List.empty(growable: true);
    final List<String> labels =
        balanceAndLedgersReport.reportColumnTitle.expand((e) {
      if (e.children.isEmpty) {
        keys.add(e.fieldName);
        return [e.title];
      } else {
        return e.children.map((e) {
          keys.add(e.fieldName);
          return e.title;
        });
      }
    }).toList();

    values = balanceAndLedgersReport.balanceAndLedgers
        .map((e) => e.getFieldsValue(keys))
        .toList();

    return DataTableViewModel(labels: labels, data: values);
  }

  static DataTableViewModel? createTableViewModelFromReportJT(
      {required ReportJameTaraz reportJameTaraz}) {
    List<ReportJameTarazData> values = List.empty(growable: true);
    final List<String> keys = List.empty(growable: true);
    final List<String> labels = reportJameTaraz.reportColumnTitle.expand((e) {
      if (e.children.isEmpty) {
        keys.add(e.fieldName);
        return [e.title];
      } else {
        return e.children.map((e) {
          keys.add(e.fieldName);
          return e.title;
        });
      }
    }).toList();

    values =
        reportJameTaraz.dataList.map((e) => e.getFieldsValue(keys)).toList();

    return DataTableViewModel(labels: labels, data: values);
  }

  static DataTableViewModel? createTableViewModelFromReportTTSH(
      {required ReportTarazTafziliShenavar reportTarazTafziliShenavar}) {
    List<ReportTarazTafziliShenavarData> values = List.empty(growable: true);
    final List<String> keys = List.empty(growable: true);
    final List<String> labels = reportTarazTafziliShenavar.reportColumnTitle.expand((e) {
      if (e.children.isEmpty) {
        keys.add(e.fieldName);
        return [e.title];
      } else {
        return e.children.map((e) {
          keys.add(e.fieldName);
          return e.title;
        });
      }
    }).toList();

    values =
        reportTarazTafziliShenavar.dataList.map((e) => e.getFieldsValue(keys)).toList();

    return DataTableViewModel(labels: labels, data: values);
  }

  static DataTableViewModel? createTableViewModelFromReportTGTSh({required ReportTarazTafziliGroup reportTarazTafziliGroup}) {
    List<ReportTarazTafziliGroupData> values = List.empty(growable: true);
    final List<String> keys = List.empty(growable: true);
    final List<String> labels = reportTarazTafziliGroup.reportColumnTitle.expand((e) {
      if (e.children.isEmpty) {
        keys.add(e.fieldName);
        return [e.title];
      } else {
        return e.children.map((e) {
          keys.add(e.fieldName);
          return e.title;
        });
      }
    }).toList();

    values =
        reportTarazTafziliGroup.dataList.map((e) => e.getFieldsValue(keys)).toList();

    return DataTableViewModel(labels: labels, data: values);
  }

  static DataTableViewModel? createTableViewModelFromReportTTShH({required ReportTarazTafziliShenavarHesab data}) {
    List<ReportTarazTafziliShenavarHesabData> values = List.empty(growable: true);
    final List<String> keys = List.empty(growable: true);
    final List<String> labels = data.reportColumnTitle.expand((e) {
      if (e.children.isEmpty) {
        keys.add(e.fieldName);
        return [e.title];
      } else {
        return e.children.map((e) {
          keys.add(e.fieldName);
          return e.title;
        });
      }
    }).toList();

    values =
        data.dataList.map((e) => e.getFieldsValue(keys)).toList();

    return DataTableViewModel(labels: labels, data: values);
  }

  static DataTableViewModel createTableViewModelFromDetailGroupRootList(
      {required List<DetailGroupRoot> detailGroupList}) {
    final List<String> labels = [
      localization.code,
      localization.name,
    ];

    return DataTableViewModel(labels: labels, data: detailGroupList);
  }
}
