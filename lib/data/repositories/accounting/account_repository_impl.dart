import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/models/accounting/accounting_acction_dto.dart';
import 'package:toolo_gostar/domain/entities/accounting/account.dart';
import 'package:toolo_gostar/domain/entities/accounting/accounting_action.dart';
import 'package:toolo_gostar/domain/repositories/accounting/account_repository.dart';

import '../../common/models/server_response_dto.dart';
import '../../datasources/accounting/accounting_remote_data_source.dart';
import '../../datasources/auth/auth_local_data_source_impl.dart';

class AccountingRepositoryImpl implements IAccountingRepository {
  final AccountingRemoteDataSource remoteDataSource;
  final AuthLocalDataSourceImpl localDataSource;

  AccountingRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<Account>> getAccountList() {
    throw UnimplementedError();
  }

  @override
  Future<List<AccountingAction>> getActions() async {
    try {

      //String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.getActionList(token: "token");
      if (serverResponse.isSuccess) {
        List<AccountingAction> accountingActionList = [];

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        accountingActionList =
            List<AccountingAction>.from(itemsAsMap.map((data) {
          return AccountingActionDto.fromMap(data);
        }));
        return accountingActionList;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  String _getToken() {
    return localDataSource.getToken();
  }
}
