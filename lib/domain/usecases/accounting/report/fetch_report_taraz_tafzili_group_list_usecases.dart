import 'package:toolo_gostar/domain/entities/accounting/reports/body/report_taraz_tafzili_group_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_taraz_tafzili_group.dart';

import '../../../repositories/accounting/accounting_repository.dart';

class FetchReportTarazTafziliGroupListUseCase {
  final IAccountingRepository _repository;

  FetchReportTarazTafziliGroupListUseCase(this._repository);

  @override
  Future<ReportTarazTafziliGroup> call({required ReportTarazTafziliGroupBody body}) async {
    return _repository.fetchReportTarazTafziliGroup(body);
  }
}
