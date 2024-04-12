import 'package:toolo_gostar/data/enum/counter_party_kinds.dart';
import 'package:toolo_gostar/domain/entities/accounting/account.dart';
import 'package:toolo_gostar/domain/entities/accounting/accounting_action.dart';

import '../../../data/models/accounting/detail_group_dto.dart';
import '../../entities/common/counterparty.dart';

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
}
