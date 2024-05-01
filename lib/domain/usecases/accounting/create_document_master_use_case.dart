import 'package:toolo_gostar/data/models/accounting/document/body/create_document_master_body_dto.dart';

import '../../repositories/accounting/accounting_repository.dart';

class CreateDocumentMasterUseCase {
  final IAccountingRepository _repository;

  CreateDocumentMasterUseCase(this._repository);

  @override
  Future<bool> call(
      {required CreateDocumentMasterBodyDto documentMasterBodyDto}) async {
    try {
      return _repository.createDocumentMaster(documentMasterBodyDto);
    } catch (e) {
      throw e.toString();
    }
  }
}
