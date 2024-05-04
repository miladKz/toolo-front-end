import 'package:toolo_gostar/domain/entities/accounting/reports/body/report_taraz_tafzili_shenavar_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_taraz_tafzili_shenavar.dart';

import '../../../repositories/accounting/accounting_repository.dart';

class FetchReportTarazTafziliShenavarListUseCase {
  final IAccountingRepository _repository;

  FetchReportTarazTafziliShenavarListUseCase(this._repository);

  @override
  Future<ReportTarazTafziliShenavar> call(
      {required ReportTarazTafziliShenavarBody body}) async {
    return _repository.fetchReportTarazTafziliShenavar(body);
  }
}
