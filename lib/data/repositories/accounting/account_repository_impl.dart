import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/enum/counter_party_kinds.dart';
import 'package:toolo_gostar/data/models/accounting/account_have_tafzili_group_dto.dart';
import 'package:toolo_gostar/data/models/accounting/accounting_acction_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/available_bank_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/bank_acc_type_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/bourse_type_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/category_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/currency_type_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/customer_status_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/detail_group_root_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/document_type_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/param/standard_detail_param_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/person_type_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/prefix_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/standard_detail_dto.dart';
import 'package:toolo_gostar/data/models/accounting/counterparty_detail_dto.dart';
import 'package:toolo_gostar/data/models/accounting/document/body/create_document_detail_body_dto.dart';
import 'package:toolo_gostar/data/models/accounting/document/body/create_document_master_body_dto.dart';
import 'package:toolo_gostar/data/models/accounting/document/document_master_detail_dto.dart';
import 'package:toolo_gostar/data/models/accounting/document/document_master_dto.dart';
import 'package:toolo_gostar/data/models/accounting/document/document_total_price_dto.dart';
import 'package:toolo_gostar/data/models/accounting/document/params/document_master_detail_param_dto.dart';
import 'package:toolo_gostar/data/models/accounting/document/params/document_master_param_dto.dart';
import 'package:toolo_gostar/data/models/accounting/document/params/document_total_price_param_dto.dart';
import 'package:toolo_gostar/data/models/accounting/reports/body/report_jame_taraz_body_dto.dart';
import 'package:toolo_gostar/data/models/accounting/reports/report_jame_taraz_dto.dart';
import 'package:toolo_gostar/data/models/accounting/tafzili_group_and_chlids_dto.dart';
import 'package:toolo_gostar/domain/entities/accounting/account.dart';
import 'package:toolo_gostar/domain/entities/accounting/account_with_tafzili_group.dart';
import 'package:toolo_gostar/domain/entities/accounting/accounting_action.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/doc_total_price.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master_detail.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/balance_and_ledgers_report.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/body/balance_and_ledgers_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/body/report_jame_taraz_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_jame_taraz.dart';
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
import 'package:toolo_gostar/domain/entities/common/counterparty.dart';
import 'package:toolo_gostar/domain/entities/common/counterparty_detail.dart';
import 'package:toolo_gostar/domain/repositories/accounting/accounting_repository.dart';

import '../../../domain/entities/base/param/standard_detail_param.dart';
import '../../common/models/server_response_dto.dart';
import '../../datasources/accounting/accounting_remote_data_source.dart';
import '../../datasources/auth/auth_local_data_source_impl.dart';
import '../../models/accounting/account_dto.dart';
import '../../models/accounting/base_dto/city_dto.dart';
import '../../models/accounting/counterparty_dto.dart';
import '../../models/accounting/document/detail_group_dto.dart';
import '../../models/accounting/reports/balance_and_ledgers_report_dto.dart';
import '../../models/accounting/reports/body/balance_and_ledgers_body_dto.dart';

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
  Future<List<AccountHaveTafziliGroup>>
      fetchAccountsListHaveTafziliGroup() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.fetchAccountsListHaveTafziliGroup(
        token: token,
      );
      if (serverResponse.isSuccess) {
        List<AccountHaveTafziliGroup> items = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<AccountHaveTafziliGroupDto>.from(itemsAsMap.map((data) {
          return AccountHaveTafziliGroupDto.fromMap(data);
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
  Future<List<TafziliGroupAndChildren>> fetchTafziliAllDataList(
      {required int accountId}) async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .fetchTafziliAllDataList(token: token, accountId: accountId);
      if (serverResponse.isSuccess) {
        List<TafziliGroupAndChildren> items = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<TafziliGroupAndChildrenDto>.from(itemsAsMap.map((data) {
          return TafziliGroupAndChildrenDto.fromMap(data);
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
        int id = serverResponse.data!.findAsInt('ID');
        counterparty.id = id;
        return counterparty;
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
      currencyType: counterparty.currencyType,
      code: counterparty.code,
      kind: counterparty.kind,
      address: counterparty.address,
      bankAccType: counterparty.bankAccType,
      bankCardNumber: counterparty.bankCardNumber,
      bursType: counterparty.bursType,
      cityId: counterparty.cityId,
      nationalCode: counterparty.nationalCode,
      postalCode: counterparty.postalCode,
      companyName: counterparty.companyName,
      sharePercentage: counterparty.sharePercentage,
      foundationDate: counterparty.foundationDate,
      description: counterparty.description,
      chequeCredit: counterparty.chequeCredit,
      rialCredit: counterparty.rialCredit,
      fax: counterparty.fax,
      firstName: counterparty.firstName,
      groupValueId: counterparty.groupValueId,
      responsibleBoard: counterparty.responsibleBoard,
      isActive: counterparty.isActive,
      isBoardMember: counterparty.isBoardMember,
      isEmployee: counterparty.isEmployee,
      isCustomer: counterparty.isCustomer,
      isInvestor: counterparty.isInvestor,
      isOtherParty: counterparty.isOtherParty,
      isShareholder: counterparty.isShareholder,
      isSupplier: counterparty.isSupplier,
      isLender: counterparty.isLender,
      isBorrower: counterparty.isBorrower,
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
      phone: counterparty.phone,
      type: counterparty.type,
      customerStatus: counterparty.customerStatus,
      brand: counterparty.brand,
      economicCode: counterparty.economicCode,
      birthCertificateNumber: counterparty.birthCertificateNumber,
    );
  }

  @override
  Future<List<DocumentMaster>> fetchDocumentMasterList(
      DocumentMasterParamDto paramDto) async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .fetchDocumentMasterList(token: token, param: paramDto);
      if (serverResponse.isSuccess) {
        List<DocumentMaster> items = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<DocumentMasterDto>.from(itemsAsMap.map((data) {
          return DocumentMasterDto.fromMap(data);
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
  Future<bool> createDocumentMaster(CreateDocumentMasterBodyDto bodyDto) async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .createDocumentMaster(token: token, body: bodyDto);
      if (serverResponse.isSuccess) {
        return true;
      } else {
        throw serverResponse.message;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> createDocumentDetail(CreateDocumentDetailBodyDto bodyDto) async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .createDocumentDetail(token: token, body: bodyDto);
      if (serverResponse.isSuccess) {
        return true;
      } else {
        throw serverResponse.message;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DocumentMasterDetail>> fetchDocumentMasterDetailList(
      DocumentMasterDetailParamDto paramDto) async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .fetchDocumentMasterDetailList(token: token, param: paramDto);
      if (serverResponse.isSuccess) {
        List<DocumentMasterDetail> items = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<DocumentMasterDetailDto>.from(itemsAsMap.map((data) {
          return DocumentMasterDetailDto.fromMap(data);
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
  Future<DocumentTotalPrice> fetchDocumentTotalPrice(
      DocumentTotalPriceParamDto paramDto) async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .fetchDocumentTotalPrice(token: token, param: paramDto);
      if (serverResponse.isSuccess) {
        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        return DocumentTotalPriceDto.fromMap(itemsAsMap);
      } else {
        throw serverResponse.message;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BankAccType>> fetchBankAccTypeList() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.fetchBankAccTypeList(token: token);
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
  Future<List<BourseType>> fetchBourseTypeList() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.fetchBourseTypeList(token: token);
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
  Future<List<CurrencyType>> fetchCurrencyTypeList() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.fetchCurrencyTypeList(token: token);
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
  Future<List<CustomerStatus>> fetchCustomerStatusList() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.fetchCustomerStatusList(token: token);
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
  Future<List<DetailGroupRoot>> fetchDetailGroupRootList() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.fetchDetailGroupRootList(token: token);
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
  Future<List<DocumentType>> fetchDocumentTypeList() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.fetchDocumentTypeList(token: token);
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
  Future<List<PersonType>> fetchPersonTypeList() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.fetchPersonTypeList(token: token);
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
  Future<List<Prefix>> fetchPrefixList() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.fetchPrefixList(token: token);
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
  Future<List<CategoryModel>> fetchCategoryList() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.fetchCategoryList(token: token);
      if (serverResponse.isSuccess) {
        List<CategoryModel> items = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<CategoryDto>.from(itemsAsMap.map((data) {
          return CategoryDto.fromMap(data);
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
  Future<List<StandardDetailDto>> fetchStandardDetailList(
      StandardDetailParam param) async {
    try {
      String token = _getToken();
      StandardDetailParamDto paramDto = getStandardDetailParamAsDto(param);

      ServerResponseDto serverResponse = await remoteDataSource
          .fetchStandardDetailList(token: token, param: paramDto);
      if (serverResponse.isSuccess) {
        List<StandardDetailDto> items = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<StandardDetailDto>.from(itemsAsMap.map((data) {
          return StandardDetailDto.fromMap(data);
        }));
        return items;
      } else {
        throw serverResponse.message;
      }
    } catch (e) {
      rethrow;
    }
  }

  StandardDetailParamDto getStandardDetailParamAsDto(
      StandardDetailParam param) {
    return StandardDetailParamDto(
      bargeTypeID: param.bargeTypeID,
      section: param.section,
    );
  }

  @override
  Future<List<AvailableBank>> fetchAvailableBankList() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.fetchAvailableBankList(token: token);
      if (serverResponse.isSuccess) {
        List<AvailableBank> items = List.empty(growable: true);

        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<AvailableBank>.from(itemsAsMap.map((data) {
          return AvailableBankDto.fromMap(data);
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
  Future<StandardDetail> createStandardDetail(StandardDetail param) async {
    StandardDetailDto standardDetailDto = getStandardDetailAsDto(param);
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .createStandardDetail(token: token, param: standardDetailDto);
      if (serverResponse.isSuccess) {
        final itemsAsMap = serverResponse.data!.findAsDynamic('Item');
        return StandardDetailDto.fromMap(itemsAsMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StandardDetail> updateStandardDetail(StandardDetail param) async {
    StandardDetailDto standardDetailDto = getStandardDetailAsDto(param);
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .updateStandardDetail(token: token, param: standardDetailDto);
      if (serverResponse.isSuccess) {
        final itemsAsMap = serverResponse.data!.findAsDynamic('Item');
        return StandardDetailDto.fromMap(itemsAsMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  StandardDetailDto getStandardDetailAsDto(StandardDetail param) {
    return StandardDetailDto(
      name: param.name,
      id: param.id,
      bargeTypeID: param.bargeTypeID,
      description: param.description,
      section: param.section,
    );
  }

  @override
  Future<List<City>> getCityList() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.getCityList(token: token, stateCode: "10");
      if (serverResponse.isSuccess) {
        List<CityDto> items = List.empty(growable: true);
        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<CityDto>.from(itemsAsMap.map((data) {
          return CityDto.fromMap(data);
        }));
        return items;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CounterpartyDetail> createCounterpartyDetail(
      CounterpartyDetail param) async {
    CounterpartyDetailDto counterpartyDetailDto =
        getCounterpartyDetailAsDto(param);
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .createCounterPartyDetail(token: token, param: counterpartyDetailDto);
      if (serverResponse.isSuccess) {
        final itemsAsMap = serverResponse.data!.findAsDynamic('Item');
        return CounterpartyDetailDto.fromMap(itemsAsMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CounterpartyDetail> updateCounterpartyDetail(
      CounterpartyDetail param) async {
    CounterpartyDetailDto counterpartyDetailDto =
        getCounterpartyDetailAsDto(param);
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .updateCounterpartyDetail(token: token, param: counterpartyDetailDto);
      if (serverResponse.isSuccess) {
        final itemsAsMap = serverResponse.data!.findAsDynamic('Item');
        return CounterpartyDetailDto.fromMap(itemsAsMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  CounterpartyDetailDto getCounterpartyDetailAsDto(CounterpartyDetail param) {
    return CounterpartyDetailDto(
      id: param.id,
      name: param.name,
      counterpartyId: param.counterpartyId,
      value: param.value,
      parentId: param.parentId,
      valueType: param.valueType,
    );
  }

  @override
  Future<List<CounterpartyDetail>> getCustomerDetailList(
      CustomerDataDetailParam customerDataDetailParam) async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.getCounterPartyDetailList(
              token: token, param: customerDataDetailParam);
      if (serverResponse.isSuccess) {
        List<CounterpartyDetailDto> items = List.empty(growable: true);
        final itemsAsMap = serverResponse.data!.findAsDynamic('Items');
        items = List<CounterpartyDetailDto>.from(itemsAsMap.map((data) {
          return CityDto.fromMap(data);
        }));
        return items;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BalanceAndLedgersReport> fetchBalanceAndLedgersReportList(
      BalanceAndLedgersBody balanceAndLedgersBody) async {
    try {
      BalanceAndLedgersBodyDto balanceAndLedgersParamDto =
          getBalanceAndLedgersParamAsDto(balanceAndLedgersBody);
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.fetchBalanceAndLedgersReportList(
              token: token, body: balanceAndLedgersParamDto);
      if (serverResponse.isSuccess) {
        print('fetchBalanceAndLedgersReportList: ${serverResponse.data}');
        final Map<String, dynamic> itemsAsMap = serverResponse.data!;
        return BalanceAndLedgersReportDto.fromMap(itemsAsMap);
      } else {
        throw serverResponse.message;
      }
    } catch (e) {
      rethrow;
    }
  }

  BalanceAndLedgersBodyDto getBalanceAndLedgersParamAsDto(
      BalanceAndLedgersBody balanceAndLedgersParam) {
    return BalanceAndLedgersBodyDto(
        activeYear: balanceAndLedgersParam.activeYear,
        fromDate: balanceAndLedgersParam.fromDate,
        toDate: balanceAndLedgersParam.toDate,
        accountCd: balanceAndLedgersParam.accountCd,
        fromNumber: balanceAndLedgersParam.fromNumber,
        toNumber: balanceAndLedgersParam.toNumber,
        fromNumber2: balanceAndLedgersParam.fromNumber2,
        toNumber2: balanceAndLedgersParam.toNumber2,
        categoryId: balanceAndLedgersParam.categoryId,
        saveTypeId: balanceAndLedgersParam.saveTypeId,
        accountLevel: balanceAndLedgersParam.accountLevel,
        displayColumn: balanceAndLedgersParam.displayColumn,
        withEftetahie: balanceAndLedgersParam.withEftetahie,
        withEkhtetamieh: balanceAndLedgersParam.withEkhtetamieh,
        withTasir: balanceAndLedgersParam.withTasir,
        withSoodZian: balanceAndLedgersParam.withSoodZian,
        withZirSath: balanceAndLedgersParam.withZirSath,
        withBastanHesabhayeMovaqat:
            balanceAndLedgersParam.withBastanHesabhayeMovaqat,
        withEntezamiAccounts: balanceAndLedgersParam.withEntezamiAccounts,
        withFaqatGardeshDarha: balanceAndLedgersParam.withFaqatGardeshDarha,
        withFaqatMandeDarha: balanceAndLedgersParam.withFaqatMandeDarha,
        withFaqatMandeDarhayeBed:
            balanceAndLedgersParam.withFaqatMandeDarhayeBed,
        withFaqatMandeDarhayeBes:
            balanceAndLedgersParam.withFaqatMandeDarhayeBes);
  }

  @override
  Future<ReportJameTaraz> fetchReportJameTaraz(
      ReportJameTarazBody jameTarazBody) async {
    try {
      ReportJameTarazBodyDto jameTarazBodyDto =
          getReportJameTarazBodyDto(jameTarazBody);
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .fetchReportJameTaraz(token: token, body: jameTarazBodyDto);
      if (serverResponse.isSuccess) {
        final Map<String, dynamic> itemsAsMap = serverResponse.data!;
        print('fetchReportJameTaraz: ${serverResponse.data}');
        return ReportJameTarazDto.fromMap(itemsAsMap);
      } else {
        throw serverResponse.message;
      }
    } catch (e) {
      rethrow;
    }
  }

  ReportJameTarazBodyDto getReportJameTarazBodyDto(
      ReportJameTarazBody reportJameTarazBody) {
    return ReportJameTarazBodyDto(
        activeYear: reportJameTarazBody.activeYear,
        fromDate: reportJameTarazBody.fromDate,
        toDate: reportJameTarazBody.toDate,
        accountCd: reportJameTarazBody.accountCd,
        fromNumber: reportJameTarazBody.fromNumber,
        toNumber: reportJameTarazBody.toNumber,
        fromNumber2: reportJameTarazBody.fromNumber2,
        toNumber2: reportJameTarazBody.toNumber2,
        categoryId: reportJameTarazBody.categoryId,
        accountLevel: reportJameTarazBody.accountLevel,
        withEftetahie: reportJameTarazBody.withEftetahie,
        withEkhtetamieh: reportJameTarazBody.withEkhtetamieh,
        withTasir: reportJameTarazBody.withTasir,
        withSoodZian: reportJameTarazBody.withSoodZian,
        withBastanHesabhayeMovaqat:
            reportJameTarazBody.withBastanHesabhayeMovaqat,
        withEntezamiAccounts: reportJameTarazBody.withEntezamiAccounts,
        withFaqatGardeshDarha: reportJameTarazBody.withFaqatGardeshDarha,
        withFaqatMandeDarha: reportJameTarazBody.withFaqatMandeDarha,
        withFaqatMandeDarhayeBed: reportJameTarazBody.withFaqatMandeDarhayeBed,
        withFaqatMandeDarhayeBes: reportJameTarazBody.withFaqatMandeDarhayeBes,
        showMandeEftetahie: reportJameTarazBody.showMandeEftetahie,
        showGardeshAvalDore: reportJameTarazBody.showGardeshAvalDore,
        showMandeAvalDore: reportJameTarazBody.showMandeAvalDore,
        showGardeshTeyDore: reportJameTarazBody.showGardeshTeyDore,
        showMandeTeyDore: reportJameTarazBody.showMandeTeyDore,
        showGardeshPayanDore: reportJameTarazBody.showGardeshPayanDore,
        showMandePayanDore: reportJameTarazBody.showMandePayanDore);
  }
}
