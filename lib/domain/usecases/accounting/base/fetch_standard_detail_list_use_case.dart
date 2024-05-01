import 'package:toolo_gostar/data/models/accounting/base_dto/param/standard_detail_param_dto.dart';
import 'package:toolo_gostar/domain/entities/base/standard_detail.dart';
import 'package:toolo_gostar/domain/repositories/accounting/accounting_repository.dart';

import '../../../entities/base/param/standard_detail_param.dart';

class FetchStandardDetailListUseCase {
  final IAccountingRepository _repository;

  FetchStandardDetailListUseCase(this._repository);

  @override
  Future<List<StandardDetail>> call(
      {required StandardDetailParam standardDetailParam}) async {
    return _repository.fetchStandardDetailList(standardDetailParam);
  }
}
