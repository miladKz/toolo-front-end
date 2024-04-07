import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/models/accounting/accounting_acction_dto.dart';
import 'package:toolo_gostar/domain/entities/accounting/account.dart';
import 'package:toolo_gostar/domain/entities/accounting/accounting_action.dart';
import 'package:toolo_gostar/domain/repositories/accounting/account_repository.dart';

import '../../common/models/server_response_dto.dart';
import '../../datasources/accounting/accounting_remote_data_source.dart';
import '../../datasources/auth/auth_local_data_source_impl.dart';
import '../../models/accounting/account_dto.dart';
import '../../models/accounting/detail_group_dto.dart';

class AccountingRepositoryImpl implements IAccountingRepository {
  final AccountingRemoteDataSource remoteDataSource;
  final AuthLocalDataSourceImpl localDataSource;

  AccountingRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<Account>> getAccountList() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.getAccountList(token: token);
      if (serverResponse.isSuccess) {
        List<AccountDto> accountList = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        accountList = List<AccountDto>.from(itemsAsMap.map((data) {
          return AccountDto.fromMap(data);
        }));
        return accountList;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AccountingAction>> getActions() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.getActionList(token: token);
      if (serverResponse.isSuccess) {
        List<AccountingAction> accountingActionList =
            List.empty(growable: true);

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

  @override
  Future<Account> updateAccount(Account account) async {
    AccountDto accountDto = getAccountAsDto(account);
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.updateAccount(token: token, param: accountDto);
      if (serverResponse.isSuccess) {
        final itemsAsMap = serverResponse.data!.findAsDynamic('Item');
        return AccountDto.fromMap(itemsAsMap);
      } else {
        throw serverResponse.message;
      }
    } catch (e) {
      rethrow;
    }
  }

  String _getToken() {
    return localDataSource.getToken();
  }

  AccountDto getAccountAsDto(Account account) {
    return AccountDto(
        id: account.id,
        accCode1: account.accCode1,
        accCode2: account.accCode2,
        accCode3: account.accCode3,
        accCode4: account.accCode4,
        accountLevel: account.accountLevel,
        accountcd: account.accountcd,
        canDel: account.canDel,
        description: account.description,
        groupCode: account.groupCode,
        hasPooli: account.hasPooli,
        hasTafzili: account.hasTafzili,
        hasTaseir: account.hasTaseir,
        indexOrder1: account.indexOrder1,
        indexOrder2: account.indexOrder2,
        isActive: account.isActive,
        isAmalyati: account.isAmalyati,
        type: account.type,
        mahiatRialy: account.mahiatRialy,
        balanceSheetType: account.balanceSheetType,
        displayName: account.displayName,
        hasChildren: account.hasChildren);
  }

  @override
  Future<String> deleteAccount(Account account) async {
    AccountDto accountDto = getAccountAsDto(account);
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.deleteAccount(token: token, param: accountDto);
      if (serverResponse.isSuccess) {
        return serverResponse.message;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Account> createAccount(Account account) async {
    AccountDto accountDto = getAccountAsDto(account);
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.createAccount(token: token, param: accountDto);
      if (serverResponse.isSuccess) {
        final itemsAsMap = serverResponse.data!.findAsDynamic('Item');
        return AccountDto.fromMap(itemsAsMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DetailGroupDto>> getDetailAccountGroupList() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.getDetailAccountList(token: token);
      if (serverResponse.isSuccess) {
        List<DetailGroupDto> detailAccountGroupList =
            List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        detailAccountGroupList =
            List<DetailGroupDto>.from(itemsAsMap.map((data) {
          return DetailGroupDto.fromMap(data);
        }));
        return detailAccountGroupList;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
