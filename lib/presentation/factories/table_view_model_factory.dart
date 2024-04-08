import 'package:toolo_gostar/domain/entities/common/counterparty.dart';
import 'package:toolo_gostar/domain/entities/common/people.dart';
import 'package:toolo_gostar/main.dart';

import '../../domain/entities/common/bank.dart';
import '../../domain/entities/common/card_reader.dart';
import '../../domain/entities/common/cash_box.dart';
import '../../domain/entities/common/city.dart';
import '../../domain/entities/common/revolving_fund.dart';
import '../view_models/table_view_model.dart';

class DataTableViewModelFactory {
  static DataTableViewModel createTableViewModelFromCities(List<City> cities) {
    final List<String> labels = [
      localization.code,
      localization.province,
      localization.city
    ];
    City city = City(id: 1, code: 1, name: 'کرج', province: 'البرز');
    City city2 = City(id: 2, code: 2, name: 'تهران', province: 'تهران');
    cities = [city, city2];
    return DataTableViewModel(labels: labels, data: cities);
  }

  static DataTableViewModel createTableViewModelFromPersonList(
      List<Counterparty> counterParties) {
    final List<String> labels = [
      localization.code,
      localization.titleNikName,
      localization.name,
      localization.nationalId
    ];
    List<People> peopleList = List.empty(growable: true);

    for (Counterparty counterparty in counterParties) {
      peopleList.add(People(counterparty: counterparty));
    }

    return DataTableViewModel(labels: labels, data: peopleList);
  }

  static DataTableViewModel createTableViewModelFromBankList(
      List<Counterparty> counterParties) {
    final List<String> labels = [
      localization.titleBankName,
      localization.code,
      localization.name,
      localization.titleCurrencyType
    ];

    final List<Bank> bankList = List.empty(growable: true);

    for (Counterparty counterparty in counterParties) {
      bankList.add(Bank(counterparty: counterparty));
    }
    return DataTableViewModel(labels: labels, data: bankList);
  }

  static DataTableViewModel createTableViewModelFromCardReaderList(
      List<Counterparty> counterParties) {
    final List<String> labels = [
      localization.code,
      localization.name,
      localization.titleCurrencyType,
      localization.description
    ];

    final List<CardReader> cardReaders = List.empty(growable: true);

    for (Counterparty counterparty in counterParties) {
      cardReaders.add(CardReader(counterparty: counterparty));
    }

    return DataTableViewModel(labels: labels, data: cardReaders);
  }

  static DataTableViewModel createTableViewModelFromRevolvingFund(
      List<Counterparty> counterpartyList) {
    final List<String> labels = [
      localization.code,
      localization.name,
      localization.titleCurrencyType,
      localization.explanation,
      localization.revolvingFundType,
      localization.revolvingFundLimit
    ];

    final List<RevolvingFund> revolvingFundList = List.empty(growable: true);

    for (Counterparty counterparty in counterpartyList) {
      revolvingFundList.add(RevolvingFund(counterparty: counterparty));
    }

    return DataTableViewModel(labels: labels, data: counterpartyList);
  }

  static DataTableViewModel createTableViewModelFromCashBoxList(
      List<Counterparty> counterParties) {
    final List<String> labels = [
      localization.code,
      localization.name,
      localization.titleCurrencyType,
      localization.description
    ];

    final List<CashBox> cashBoxList = List.empty(growable: true);

    for (Counterparty counterparty in counterParties) {
      cashBoxList.add(CashBox(counterparty: counterparty));
    }

    return DataTableViewModel(labels: labels, data: cashBoxList);
  }
}
