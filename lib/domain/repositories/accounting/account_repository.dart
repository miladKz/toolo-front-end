import 'package:toolo_gostar/domain/entities/accounting/account.dart';
import 'package:toolo_gostar/domain/entities/accounting/accounting_action.dart';

import '../../../data/models/accounting/detail_group_dto.dart';

abstract class IAccountingRepository {

  Future<List<AccountingAction>> getActions();

  Future<List<Account>> getAccountList();

  Future<Account> createAccount(Account account);
  Future<Account> updateAccount(Account account);

  Future<String> deleteAccount(Account account);

  Future<List<DetailGroupDto>> getDetailAccountGroupList();
}
