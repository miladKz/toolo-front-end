import 'package:toolo_gostar/data/models/base_dto/param/standard_detail_param_dto.dart';
import 'package:toolo_gostar/domain/entities/base/standard_detail.dart';
import 'package:toolo_gostar/domain/repositories/accounting/account_repository.dart';

class FetchStandardDetailListUseCase {
  final IAccountingRepository _repository;

  FetchStandardDetailListUseCase(this._repository);

  @override
  Future<List<StandardDetail>> call(
      {required StandardDetailParamDto standardDetailParamDto}) async {
    return _repository.fetchStandardDetailList(standardDetailParamDto);
  }
}
