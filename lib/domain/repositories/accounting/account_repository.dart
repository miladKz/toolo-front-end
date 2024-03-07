import 'package:toolo_gostar/domain/entities/accounting/account.dart';
import 'package:toolo_gostar/domain/entities/accounting/accounting_action.dart';

abstract class IAccountingRepository {

  Future<List<Account>> getAccountList();
  Future<List<AccountingAction>> getActions();
}
