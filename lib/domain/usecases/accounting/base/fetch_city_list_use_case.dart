import 'package:toolo_gostar/domain/repositories/accounting/accounting_repository.dart';

import '../../../entities/common/city.dart';

class FetchCityListUseCase {
  final IAccountingRepository _repository;

  FetchCityListUseCase(this._repository);

  @override
  Future<List<City>> call() async {
    return _repository.getCityList();
  }
}
