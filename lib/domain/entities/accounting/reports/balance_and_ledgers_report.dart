import 'package:toolo_gostar/presentation/widgets/main/generic_tree_view/widget_tree_model_abs.dart';

class BalanceAndLedgersReport extends IDataTreeModel {
  BalanceAndLedgersReport(
      {required super.displayName,
      required super.id,
      required super.hasChildren,
      required super.children});

  factory BalanceAndLedgersReport.empty() {
    return BalanceAndLedgersReport(
        displayName: '', id: 0, children: [], hasChildren: false);
  }
}
