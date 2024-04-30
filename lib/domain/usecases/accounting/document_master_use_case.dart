import 'package:toolo_gostar/data/models/accounting/document/params/document_master_param_dto.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master.dart';

import '../../repositories/accounting/account_repository.dart';

class FetchDocumentMasterListUseCase {
  final IAccountingRepository _repository;

  FetchDocumentMasterListUseCase(this._repository);

  @override
  Future<List<DocumentMaster>> call(
      {required DocumentMasterParamDto documentMasterParamDto}) async {
    try {
      return _repository.fetchDocumentMasterList(documentMasterParamDto);
    } catch (e) {
      throw e.toString();
    }
  }
}
