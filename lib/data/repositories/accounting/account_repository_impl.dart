import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/enum/counter_party_kinds.dart';
import 'package:toolo_gostar/data/models/accounting/accounting_acction_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/bank_acc_type_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/bourse_type_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/currency_type_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/customer_status_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/detail_group_root_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/document_type_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/param/standard_detail_param_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/person_type_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/prefix_dto.dart';
import 'package:toolo_gostar/domain/entities/accounting/account.dart';
import 'package:toolo_gostar/domain/entities/accounting/accounting_action.dart';
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



  @override
  Future<List<BankAccType>> fetchBankAccTypeList() async{
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .fetchBankAccTypeList(token: token);
      if (serverResponse.isSuccess) {
        List<BankAccType> items = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<BankAccTypeDto>.from(itemsAsMap.map((data) {
          return BankAccTypeDto.fromMap(data);
        }));
        return items;
      } else {
        throw serverResponse.message;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BourseType>> fetchBourseTypeList() async{
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .fetchBourseTypeList(token: token);
      if (serverResponse.isSuccess) {
        List<BourseType> items = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<BourseTypeDto>.from(itemsAsMap.map((data) {
          return BourseTypeDto.fromMap(data);
        }));
        return items;
      } else {
        throw serverResponse.message;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CurrencyType>> fetchCurrencyTypeList() async{
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource.fetchCurrencyTypeList(token: token);
      if (serverResponse.isSuccess) {
        List<CurrencyType> items = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<CurrencyTypeDto>.from(itemsAsMap.map((data) {
          return CurrencyTypeDto.fromMap(data);
        }));
        return items;
      } else {
        throw serverResponse.message;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CustomerDataDetail>> fetchCustomerDataDetailList(CustomerDataDetailParam customerDataDetailParam) async{
    // TODO: implement fetchCustomerDataDetailList
    throw UnimplementedError();
  }

  @override
  Future<List<CustomerStatus>> fetchCustomerStatusList() async{
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource.fetchCustomerStatusList(token: token);
      if (serverResponse.isSuccess) {
        List<CustomerStatus> items = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<CustomerStatusDto>.from(itemsAsMap.map((data) {
          return CustomerStatusDto.fromMap(data);
        }));
        return items;
      } else {
        throw serverResponse.message;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DetailGroupRoot>> fetchDetailGroupRootList() async{
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource.fetchDetailGroupRootList(token: token);
      if (serverResponse.isSuccess) {
        List<DetailGroupRoot> items = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<DetailGroupRootDto>.from(itemsAsMap.map((data) {
          return DetailGroupRootDto.fromMap(data);
        }));
        return items;
      } else {
        throw serverResponse.message;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DocumentType>> fetchDocumentTypeList() async{
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource.fetchDocumentTypeList(token: token);
      if (serverResponse.isSuccess) {
        List<DocumentType> items = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<DocumentTypeDto>.from(itemsAsMap.map((data) {
          return DocumentTypeDto.fromMap(data);
        }));
        return items;
      } else {
        throw serverResponse.message;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PersonType>> fetchPersonTypeList() async{
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource.fetchPersonTypeList(token: token);
      if (serverResponse.isSuccess) {
        List<PersonType> items = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<PersonTypeDto>.from(itemsAsMap.map((data) {
          return PersonTypeDto.fromMap(data);
        }));
        return items;
      } else {
        throw serverResponse.message;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Prefix>> fetchPrefixList() async{
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource.fetchPrefixList(token: token);
      if (serverResponse.isSuccess) {
        List<Prefix> items = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<PrefixDto>.from(itemsAsMap.map((data) {
          return PrefixDto.fromMap(data);
        }));
        return items;
      } else {
        throw serverResponse.message;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<StandardDetail>> fetchStandardDetailList(StandardDetailParamDto param) async{
    // TODO: implement fetchStandardDetailList
    throw UnimplementedError();
  }
}
