import 'package:toolo_gostar/domain/entities/base/detail_group_root.dart';
import 'package:toolo_gostar/domain/repositories/accounting/accounting_repository.dart';

class FetchDetailGroupRootListUseCase {
  final IAccountingRepository _repository;

  FetchDetailGroupRootListUseCase(this._repository);

  @override
  Future<List<DetailGroupRoot>> call() async {
    return _repository.fetchDetailGroupRootList();
  }
}
