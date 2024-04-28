import 'package:toolo_gostar/data/models/accounting/base_dto/param/standard_detail_param_dto.dart';
import 'package:toolo_gostar/domain/entities/base/standard_detail.dart';
import 'package:toolo_gostar/domain/repositories/accounting/account_repository.dart';

import '../../../entities/base/param/standard_detail_param.dart';

class UpdateStandardDetailUseCase {
  final IAccountingRepository _repository;

  UpdateStandardDetailUseCase(this._repository);

  @override
  Future<StandardDetail> call(
      {required StandardDetail standardDetail}) async {
    return _repository.updateStandardDetail(standardDetail);
  }
}
