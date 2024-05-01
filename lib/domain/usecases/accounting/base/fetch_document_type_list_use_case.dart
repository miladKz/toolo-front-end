import 'package:toolo_gostar/domain/entities/base/document_type.dart';
import 'package:toolo_gostar/domain/repositories/accounting/accounting_repository.dart';

class FetchDocumentTypeListUseCase {
  final IAccountingRepository _repository;

  FetchDocumentTypeListUseCase(this._repository);

  @override
  Future<List<DocumentType>> call() async {
    return _repository.fetchDocumentTypeList();
  }
}
