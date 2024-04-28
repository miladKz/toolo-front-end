import 'package:toolo_gostar/data/models/accounting/base_dto/param/standard_detail_param_dto.dart';
import 'package:toolo_gostar/domain/entities/base/standard_detail.dart';
import 'package:toolo_gostar/domain/repositories/accounting/account_repository.dart';

import '../../../entities/base/param/standard_detail_param.dart';

class CreateStandardDetailUseCase {
  final IAccountingRepository _repository;

  CreateStandardDetailUseCase(this._repository);

  @override
  Future<StandardDetail> call(StandardDetail standardDetail) async {
    return _repository.createStandardDetail(standardDetail);
  }
}
