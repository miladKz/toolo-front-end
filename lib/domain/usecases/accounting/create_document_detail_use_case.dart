import 'package:toolo_gostar/data/models/accounting/document/body/create_document_detail_body_dto.dart';

import '../../repositories/accounting/accounting_repository.dart';

class CreateDocumentDetailUseCase {
  final IAccountingRepository _repository;

  CreateDocumentDetailUseCase(this._repository);

  @override
  Future<bool> call(
      {required CreateDocumentDetailBodyDto documentDetailBodyDto}) async {
    try {
      return _repository.createDocumentDetail(documentDetailBodyDto);
    } catch (e) {
      throw e.toString();
    }
  }
}
