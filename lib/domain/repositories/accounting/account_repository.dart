import 'package:toolo_gostar/domain/entities/accounting/account.dart';
import 'package:toolo_gostar/domain/entities/accounting/accounting_action.dart';

abstract class IAccountingRepository {

  Future<List<AccountingAction>> getActions();

  Future<List<Account>> getAccountList();
  Future<Account> updateAccount(Account account);

  Future<String> deleteAccount(Account account);
}
