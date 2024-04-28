import 'package:toolo_gostar/data/enum/counter_party_kinds.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/param/standard_detail_param_dto.dart';
import 'package:toolo_gostar/data/models/accounting/counterparty_detail_dto.dart';
import 'package:toolo_gostar/domain/entities/accounting/account.dart';
import 'package:toolo_gostar/domain/entities/accounting/accounting_action.dart';
import 'package:toolo_gostar/domain/entities/base/available_bank_.dart';
import 'package:toolo_gostar/domain/entities/base/bank_acc_type.dart';
import 'package:toolo_gostar/domain/entities/base/bourse_type.dart';
import 'package:toolo_gostar/domain/entities/base/currency_type.dart';
import 'package:toolo_gostar/domain/entities/base/customer_data_detail.dart';
import 'package:toolo_gostar/domain/entities/base/customer_status.dart';
import 'package:toolo_gostar/domain/entities/base/detail_group_root.dart';
import 'package:toolo_gostar/domain/entities/base/document_type.dart';
import 'package:toolo_gostar/domain/entities/base/param/customer_data_detail_param.dart';
import 'package:toolo_gostar/domain/entities/base/person_type.dart';
import 'package:toolo_gostar/domain/entities/base/prefix.dart';
import 'package:toolo_gostar/domain/entities/base/standard_detail.dart';

import '../../../data/models/accounting/detail_group_dto.dart';
import '../../entities/base/param/standard_detail_param.dart';
import '../../entities/common/city.dart';
import '../../entities/common/counterparty.dart';
import '../../entities/common/counterparty_detail.dart';

abstract class IAccountingRepository {
  Future<List<AccountingAction>> getActions();

  Future<List<Account>> getAccountList();

  Future<Account> createAccount(Account account);

  Future<Account> updateAccount(Account account);

  Future<String> deleteAccount(Account account);

  Future<List<DetailGroupDto>> getDetailAccountGroupList();

  Future<List<Counterparty>> getCounterpartyList(CounterPartyKinds kind);

  Future<Counterparty> createCounterparty(Counterparty counterparty);

  Future<Counterparty> updateCounterparty(Counterparty counterparty);

  Future<String> deleteCounterparty(Counterparty counterparty);

  //______________________________________Base Api____________________________________

  Future<List<BankAccType>> fetchBankAccTypeList();

  Future<List<BursType>> fetchBourseTypeList();

  Future<List<CurrencyType>> fetchCurrencyTypeList();

  Future<List<CustomerStatus>> fetchCustomerStatusList();

  Future<List<DocumentType>> fetchDocumentTypeList();

  Future<List<PersonType>> fetchPersonTypeList();

  Future<List<Prefix>> fetchPrefixList();

  Future<List<AvailableBank>> fetchAvailableBankList();

  Future<List<City>> getCityList();

  Future<List<StandardDetail>> fetchStandardDetailList(
      StandardDetailParam param);

  Future<StandardDetail> createStandardDetail(
      StandardDetail param);

  Future<StandardDetail> updateStandardDetail(
      StandardDetail param);

  Future<List<DetailGroupRoot>> fetchDetailGroupRootList();

  Future<List<CounterpartyDetail>> getCustomerDetailList(CustomerDataDetailParam customerDataDetailParam);

  Future<CounterpartyDetail> createCounterpartyDetail(
      CounterpartyDetail param);

  Future<CounterpartyDetail> updateCounterpartyDetail(
      CounterpartyDetail param);
}
