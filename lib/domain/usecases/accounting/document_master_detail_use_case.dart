import 'package:toolo_gostar/data/models/accounting/document/params/document_master_detail_param_dto.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master_detail.dart';

import '../../repositories/accounting/account_repository.dart';

class FetchDocumentMasterDetailListUseCase {
  final IAccountingRepository _repository;

  FetchDocumentMasterDetailListUseCase(this._repository);

  @override
  Future<List<DocumentMasterDetail>> call(
      {required DocumentMasterDetailParamDto documentMasterDetailParamDto}) async {
    try {
      return _repository.fetchDocumentMasterDetailList(documentMasterDetailParamDto);
    } catch (e) {
      throw e.toString();
    }
  }
}
