import 'package:toolo_gostar/domain/entities/common/bank_model.dart';
import 'package:toolo_gostar/main.dart';

import '../../domain/entities/common/city.dart';
import '../../domain/entities/common/revolving_fund.dart';
import '../view_models/table_view_model.dart';

class DataTableViewModelFactory {
  static DataTableViewModel createTableViewModelFromCities(List<City> cities) {
    final List<String> labels = [localization.code, localization.province, localization.city];
    City city = City(id: 1,code:1, name: 'کرج', province: 'البرز');
    City city2 = City(id: 2,code:2, name: 'تهران', province: 'تهران');
    cities = [city, city2];
    return DataTableViewModel(labels: labels, data: cities);
  }
  static DataTableViewModel createTableViewModelFromRevolvingFund(List<RevolvingFund> revolvingFound) {
    final List<String> labels = [localization.explanation];
    RevolvingFund tankhah = RevolvingFund(id: 1,description: "تنخواه دستگاه مرکزی");
    RevolvingFund tankhah2 = RevolvingFund(id: 2,description: "تنخواه کارخانه");
    revolvingFound = [tankhah, tankhah2];
    return DataTableViewModel(labels: labels, data: revolvingFound);
  }
  static DataTableViewModel createTableViewModelBankList(List<BankModel> bankList) {
    final List<String> labels = [localization.code,localization.name];
    BankModel row1 = const BankModel(id: 1,code:1,name: "بانک صادرات ایران جاری 109582186003 به نام آلومینیوم صنعت نوین اگرین شعبه ستارخان کد:805بانک صادرات ایران");
    BankModel row2 = const BankModel(id: 2,code:2,name: "بانک پاسارگاد کوتاه مدت  02338001375604758 به نام آلومینیوم صنعت نوین اگرین شعبه ستارخان کد:222");
    bankList = [row1, row2];
    return DataTableViewModel(labels: labels, data: bankList);
  }
}