import 'package:toolo_gostar/data/enum/counter_party_kinds.dart';
import 'package:toolo_gostar/domain/entities/accounting/account.dart';
import 'package:toolo_gostar/domain/entities/accounting/accounting_action.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/doc_total_price.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master_detail.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/params/balance_and_ledgers_param.dart';
import 'package:toolo_gostar/domain/entities/accounting/tafzili_group_and_child.dart';
import 'package:toolo_gostar/domain/entities/base/available_bank_.dart';
import 'package:toolo_gostar/domain/entities/base/bank_acc_type.dart';
import 'package:toolo_gostar/domain/entities/base/bourse_type.dart';
import 'package:toolo_gostar/domain/entities/base/category.dart';
import 'package:toolo_gostar/domain/entities/base/currency_type.dart';
import 'package:toolo_gostar/domain/entities/base/customer_status.dart';
import 'package:toolo_gostar/domain/entities/base/detail_group_root.dart';
import 'package:toolo_gostar/domain/entities/base/document_type.dart';
import 'package:toolo_gostar/domain/entities/base/param/customer_data_detail_param.dart';
import 'package:toolo_gostar/domain/entities/base/person_type.dart';
import 'package:toolo_gostar/domain/entities/base/prefix.dart';
import 'package:toolo_gostar/domain/entities/base/standard_detail.dart';
import 'package:toolo_gostar/domain/entities/common/city.dart';

import '../../../data/models/accounting/document/body/create_document_detail_body_dto.dart';
import '../../../data/models/accounting/document/body/create_document_master_body_dto.dart';
import '../../../data/models/accounting/document/detail_group_dto.dart';
import '../../../data/models/accounting/document/params/document_master_detail_param_dto.dart';
import '../../../data/models/accounting/document/params/document_master_param_dto.dart';
import '../../../data/models/accounting/document/params/document_total_price_param_dto.dart';
import '../../entities/accounting/account_with_tafzili_group.dart';
import '../../entities/accounting/reports/balance_and_ledgers_report.dart';
import '../../entities/base/param/standard_detail_param.dart';
import '../../entities/common/counterparty.dart';
import '../../entities/common/counterparty_detail.dart';

abstract class IAccountingRepository {
  Future<List<AccountingAction>> getActions();

  Future<List<Account>> getAccountList();

  Future<Account> createAccount(Account account);

  Future<Account> updateAccount(Account account);

  Future<String> deleteAccount(Account account);

  Future<List<AccountHaveTafziliGroup>> fetchAccountsListHaveTafziliGroup();

  Future<List<TafziliGroupAndChildren>> fetchTafziliAllDataList(
      {required int accountId});

  Future<List<DetailGroupDto>> getDetailAccountGroupList();

  Future<List<Counterparty>> getCounterpartyList(CounterPartyKinds kind);

  Future<Counterparty> createCounterparty(Counterparty counterparty);

  Future<Counterparty> updateCounterparty(Counterparty counterparty);

  Future<String> deleteCounterparty(Counterparty counterparty);

  Future<List<DocumentMaster>> fetchDocumentMasterList(
      DocumentMasterParamDto paramDto);

  Future<List<DocumentMasterDetail>> fetchDocumentMasterDetailList(
      DocumentMasterDetailParamDto paramDto);

  Future<DocumentTotalPrice> fetchDocumentTotalPrice(
      DocumentTotalPriceParamDto paramDto);

  Future<bool> createDocumentMaster(CreateDocumentMasterBodyDto bodyDto);

  Future<bool> createDocumentDetail(CreateDocumentDetailBodyDto bodyDto);

  //______________________________________Base Api____________________________________

  Future<List<BankAccType>> fetchBankAccTypeList();

  Future<List<BourseType>> fetchBourseTypeList();

  Future<List<CurrencyType>> fetchCurrencyTypeList();

  Future<List<CustomerStatus>> fetchCustomerStatusList();

  Future<List<DocumentType>> fetchDocumentTypeList();

  Future<List<PersonType>> fetchPersonTypeList();

  Future<List<AvailableBank>> fetchAvailableBankList();

  Future<List<City>> getCityList();

  Future<List<Prefix>> fetchPrefixList();

  Future<List<CategoryModel>> fetchCategoryList();

  Future<List<StandardDetail>> fetchStandardDetailList(
      StandardDetailParam param);

  Future<StandardDetail> createStandardDetail(StandardDetail param);

  Future<StandardDetail> updateStandardDetail(StandardDetail param);

  Future<List<DetailGroupRoot>> fetchDetailGroupRootList();

  Future<List<CounterpartyDetail>> getCustomerDetailList(
      CustomerDataDetailParam customerDataDetailParam);

  Future<CounterpartyDetail> createCounterpartyDetail(CounterpartyDetail param);

  Future<CounterpartyDetail> updateCounterpartyDetail(CounterpartyDetail param);

  //______________________________________ reports ____________________________

  Future<BalanceAndLedgersReport> fetchBalanceAndLedgersReportList(
      BalanceAndLedgersParam balanceAndLedgersParam);
}
