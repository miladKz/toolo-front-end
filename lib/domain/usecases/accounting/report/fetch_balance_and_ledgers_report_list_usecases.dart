import '../../../entities/accounting/reports/balance_and_ledgers_report.dart';
import '../../../entities/accounting/reports/params/balance_and_ledgers_param.dart';
import '../../../repositories/accounting/accounting_repository.dart';

class FetchBalanceAndLedgersReportListUseCase {
  final IAccountingRepository _repository;

  FetchBalanceAndLedgersReportListUseCase(this._repository);

  @override
  Future<BalanceAndLedgersReport> call({required BalanceAndLedgersParam body}
     ) async {
    return _repository.fetchBalanceAndLedgersReportList(body);
  }
}
