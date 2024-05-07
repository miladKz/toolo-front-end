import 'package:toolo_gostar/domain/entities/accounting/reports/body/balance_and_ledgers_body.dart';

import '../../../entities/accounting/reports/report_t_d_p_data.dart';
import '../../../repositories/accounting/accounting_repository.dart';

class FetchBalanceAndLedgersReportListUseCase {
  final IAccountingRepository _repository;

  FetchBalanceAndLedgersReportListUseCase(this._repository);

  @override
  Future<BalanceAndLedgersReport> call({required BalanceAndLedgersBody body}
     ) async {
    return _repository.fetchBalanceAndLedgersReportList(body);
  }
}
