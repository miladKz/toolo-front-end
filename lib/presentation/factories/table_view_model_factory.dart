import 'package:toolo_gostar/main.dart';

import '../../domain/entities/common/city.dart';
import '../../domain/entities/common/revolving_fund.dart';
import '../view_models/table_view_model.dart';

class TableViewModelFactory {
  static TableViewModel createTableViewModelFromCities(List<City> cities) {
    final List<String> labels = [localization.code, localization.province, localization.city];
    return TableViewModel(labels: labels, data: cities);
  }
  static TableViewModel createTableViewModelFromRevolvingFund(List<RevolvingFund> revolvingFound) {
    final List<String> labels = [localization.explanation];
    return TableViewModel(labels: labels, data: revolvingFound);
  }
}