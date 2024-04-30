import 'package:toolo_gostar/data/models/accounting/document/params/document_total_price_param_dto.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/doc_total_price.dart';

import '../../repositories/accounting/account_repository.dart';

class FetchDocumentTotalPriceUseCase {
  final IAccountingRepository _repository;

  FetchDocumentTotalPriceUseCase(this._repository);

  @override
  Future<DocumentTotalPrice> call(
      {required DocumentTotalPriceParamDto documentTotalPriceParamDto}) async {
    try {
      return _repository.fetchDocumentTotalPrice(documentTotalPriceParamDto);
    } catch (e) {
      throw e.toString();
    }
  }
}
