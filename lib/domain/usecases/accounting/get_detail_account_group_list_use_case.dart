import 'package:toolo_gostar/domain/entities/accounting/account.dart';
import 'package:toolo_gostar/domain/entities/accounting/detail_group.dart';

import '../../repositories/accounting/accounting_repository.dart';

class GetDetailAccountGroupListUseCase {
  final IAccountingRepository _repository;

  GetDetailAccountGroupListUseCase(this._repository);

  @override
  Future<List<DetailGroup>> call() async {
    return _repository.getDetailAccountGroupList();
  }
}
