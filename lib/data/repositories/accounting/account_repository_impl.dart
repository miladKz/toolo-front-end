import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/enum/counter_party_kinds.dart';
import 'package:toolo_gostar/data/models/accounting/accounting_acction_dto.dart';
import 'package:toolo_gostar/domain/entities/accounting/account.dart';
import 'package:toolo_gostar/domain/entities/accounting/accounting_action.dart';
import 'package:toolo_gostar/domain/entities/common/counterparty.dart';
import 'package:toolo_gostar/domain/repositories/accounting/account_repository.dart';

import '../../common/models/server_response_dto.dart';
import '../../datasources/accounting/accounting_remote_data_source.dart';
import '../../datasources/auth/auth_local_data_source_impl.dart';
import '../../models/accounting/account_dto.dart';
import '../../models/accounting/counterparty_dto.dart';
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

  @override
  Future<List<Counterparty>> getCounterpartyList(CounterPartyKinds kind) async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.getCounterPartyList(token: token, kind: kind);
      if (serverResponse.isSuccess) {
        List<CounterpartyDto> customerList = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        customerList = List<CounterpartyDto>.from(itemsAsMap.map((data) {
          return CounterpartyDto.fromMap(data);
        }));
        return customerList;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Counterparty> createCounterparty(Counterparty counterparty) async {
    CounterpartyDto counterpartyDto = getCounterpartyAsDto(counterparty);
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .createCounterParty(token: token, param: counterpartyDto);
      if (serverResponse.isSuccess) {
        final itemsAsMap = serverResponse.data!.findAsDynamic('Item');
        return CounterpartyDto.fromMap(itemsAsMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Counterparty> updateCounterparty(Counterparty counterparty) async {
    CounterpartyDto counterpartyDto = getCounterpartyAsDto(counterparty);
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .updateCounterparty(token: token, param: counterpartyDto);
      if (serverResponse.isSuccess) {
        final itemsAsMap = serverResponse.data!.findAsDynamic('Item');
        return CounterpartyDto.fromMap(itemsAsMap);
      } else {
        throw serverResponse.message;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> deleteCounterparty(Counterparty counterparty) async {
    CounterpartyDto counterpartyDto = getCounterpartyAsDto(counterparty);
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .deleteCounterparty(token: token, param: counterpartyDto);
      if (serverResponse.isSuccess) {
        return serverResponse.message;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  CounterpartyDto getCounterpartyAsDto(Counterparty counterparty) {
    return CounterpartyDto(
        id: counterparty.id,
        currencyType:  counterparty.currencyType,
        code: counterparty.code,
        kind: counterparty.kind,
        address: counterparty.address,
        bankAccType: counterparty.bankAccType,
        bankCardNumber: counterparty.bankCardNumber,
        exchangeType: counterparty.exchangeType,
        cityId: counterparty.cityId,
        nationalCode: counterparty.nationalCode,
        postalCode: counterparty.postalCode,
        companyName: counterparty.companyName,
        sharePercentage: counterparty.sharePercentage,
        foundationDate: counterparty.foundationDate,
        description: counterparty.description,
        creditCheck: counterparty.creditCheck,
        creditRial: counterparty.creditRial,
        fax: counterparty.fax,
        firstName: counterparty.firstName,
        groupValueId: counterparty.groupValueId,
        responsibleBoard: counterparty.responsibleBoard,
        isActive: counterparty.isActive,
        isBlackList: counterparty.isBlackList,
        isBoardMember: counterparty.isBoardMember,
        isStaff: counterparty.isStaff,
        isCustomer: counterparty.isCustomer,
        isInvestee: counterparty.isInvestee,
        isOther: counterparty.isOther,
        isPartner: counterparty.isPartner,
        isSupply: counterparty.isSupply,
        isFacilitator: counterparty.isFacilitator,
        isReceiverFacility: counterparty.isReceiverFacility,
        isDependent: counterparty.isDependent,
        isIntermediary: counterparty.isIntermediary,
        lastName: counterparty.lastName,
        name: counterparty.name,
        parentId: counterparty.parentId,
        passportNumber: counterparty.passportNumber,
        prefixId: counterparty.prefixId,
        jobTitle: counterparty.jobTitle,
        shebaNumber: counterparty.shebaNumber,
        registrationNumber: counterparty.registrationNumber,
        nationality: counterparty.nationality,
        detailId: counterparty.detailId,
        tel: counterparty.tel,
        type: counterparty.type);
  }
}
