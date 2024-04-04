import 'package:toolo_gostar/domain/entities/common/abstracts/table_row_data_abs.dart';
import 'package:toolo_gostar/domain/entities/common/accounting_document.dart';
import 'package:toolo_gostar/domain/entities/common/bank_list.dart';
import 'package:toolo_gostar/domain/entities/common/manage_people.dart';
import 'package:toolo_gostar/domain/entities/common/revolving_fund_main.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/fake_data/fake_tree_view_model.dart';
import 'package:toolo_gostar/presentation/view_models/table_view_model.dart';
import 'package:toolo_gostar/presentation/widgets/main/generic_tree_view/widget_tree_model_abs.dart';

class FakeData {
  static List<IDataTreeModel> getFloatingDetailList = [
    FakeTreeViewModel(
        displayName: 'اشخصاص',
        id: 1,
        hasChildren: true,
        children: [
          FakeTreeViewModel(
              displayName: 'حمیرا جمشیدی پور',
              id: 4,
              hasChildren: false,
              children: []),
          FakeTreeViewModel(
              displayName: 'عایق ساز پشم شیشه ایران',
              id: 5,
              hasChildren: false,
              children: []),
          FakeTreeViewModel(
              displayName: 'سپید ماکیان',
              id: 6,
              hasChildren: false,
              children: []),
          FakeTreeViewModel(
              displayName: 'مهدی زمانی',
              id: 7,
              hasChildren: false,
              children: []),
        ]),
    FakeTreeViewModel(
        displayName: 'بانک ها',
        id: 2,
        hasChildren: true,
        children: [
          FakeTreeViewModel(
              displayName: 'بانک صادرات',
              id: 8,
              hasChildren: false,
              children: []),
          FakeTreeViewModel(
              displayName: 'بانک سامان',
              id: 9,
              hasChildren: false,
              children: []),
        ]),
    FakeTreeViewModel(
        displayName: 'کارتخوان ها', id: 3, hasChildren: false, children: [])
  ];
  static List<IDataTreeModel> getRelationShipAccountManagement = [
    FakeTreeViewModel(
        displayName: 'اشخصاص',
        id: 1,
        hasChildren: true,
        children: [
          FakeTreeViewModel(
              displayName: 'پیش پرداخت مواد اولیه- 15/151/003',
              id: 4,
              hasChildren: false,
              children: []),
          FakeTreeViewModel(
              displayName: 'مساعده کارکنان- 15/158/001',
              id: 5,
              hasChildren: false,
              children: []),
          FakeTreeViewModel(
              displayName: 'وام کارکنان- 15/158/006',
              id: 6,
              hasChildren: false,
              children: []),
        ]),
    FakeTreeViewModel(
        displayName: 'بانک ها',
        id: 2,
        hasChildren: true,
        children: [
          FakeTreeViewModel(
              displayName: 'وجوه بانکی مسدود شده- 11/121/001',
              id: 8,
              hasChildren: false,
              children: []),
          FakeTreeViewModel(
              displayName: 'بانکها - ریالی- 15/161/002',
              id: 9,
              hasChildren: false,
              children: []),
        ]),
    FakeTreeViewModel(
        displayName: 'صندوق', id: 3, hasChildren: false, children: []),
    FakeTreeViewModel(
        displayName: 'کالاها', id: 4, hasChildren: false, children: [])
  ];

  static DataTableViewModel getManagePeopleData() {
    List<ITableRowData> list = List.empty(growable: true);
    final List<String> labels = [
      localization.code,
      localization.titleNikName,
      localization.name,
      localization.nationalId
    ];
    ManagePeople row1 = ManagePeople(
        id: 1,
        code: 1,
        name: 'حمیرا جمشیدی پور',
        nationalID: 10960020082,
        nickname: 'انتخاب نشده');
    ManagePeople row2 = ManagePeople(
        id: 2,
        code: 2,
        name: 'عایق ساز پشم شیشه تهران',
        nationalID: 10102696405,
        nickname: 'انتخاب نشده');
    ManagePeople row3 = ManagePeople(
        id: 2,
        code: 3,
        name: 'سپید ماکیان',
        nationalID: 10720977661,
        nickname: 'انتخاب نشده');
    list = [row1, row2, row3];
    return DataTableViewModel(labels: labels, data: list);
  }

  static DataTableViewModel getBankListData() {
    List<ITableRowData> list = List.empty(growable: true);
    final List<String> labels = [
      localization.titleBankName,
      localization.titleBankBranchCode,
      localization.titleBankBranchName,
      localization.titleCurrencyType
    ];
    BankList row1 = BankList(
        id: 1,
        bankName: 'بانک صادرات ایران جاری',
        branchCode: 805,
        branchName: ' بانک صادرات ایران',
        currencyType: 'ریال');
    BankList row2 = BankList(
        id: 2,
        bankName: 'بانک پاسارگاد کوتاه مدت',
        branchCode: 222,
        branchName: 'بانک پاسارگاد',
        currencyType: 'ریال');

    list = [
      row1,
      row2,
    ];
    return DataTableViewModel(labels: labels, data: list);
  }

  static DataTableViewModel getCarsReaderData() {
    List<ITableRowData> list = List.empty(growable: true);
    final List<String> labels = [
      localization.code,
      localization.name,
      localization.titleCurrencyType,
      localization.description
    ];

    return DataTableViewModel(labels: labels, data: list);
  }

  static DataTableViewModel getRevolvingFundData() {
    List<ITableRowData> list = List.empty(growable: true);
    final List<String> labels = [
      localization.code,
      localization.name,
      localization.titleCurrencyType,
      localization.description,
      localization.revolvingFundType,
      localization.revolvingFundLimit,
    ];
    RevolvingFundMain row1 = RevolvingFundMain(
        id: 1,
        code: 1,
        name: 'نگین حقیقی تنخواه دفتر مرکزی',
        currencyType: 'ریال',
        description: '-',
        revolvingFundType: 'تنخواه دفتر مرکزی',
        ceilingFund: 0);
    RevolvingFundMain row2 = RevolvingFundMain(
        id: 2,
        code: 2,
        name: 'تنخواه علیرضا کمری تنخواه کارخانه',
        currencyType: 'ریال',
        description: '-',
        revolvingFundType: 'تنخواه کارخانه',
        ceilingFund: 0);

    list = [
      row1,
      row2,
    ];
    return DataTableViewModel(labels: labels, data: list);
  }

  static DataTableViewModel getAccountingDocumentMain() {
    List<ITableRowData> list = List.empty(growable: true);

    final List<String> labels = [
      localization.titleReference,
      localization.titleDaily,
      localization.titleMonthly,
      localization.titleDocument,
      localization.titleDocumentDate,
      localization.status,
      localization.titleTotal,
      localization.titleDetailDocument,
      localization.titleSeparationType,
      localization.titleDocumentType,
      localization.titleCeilingNumber,
      localization.titleIssuerSystem,
      localization.titleNote,
    ];
    AccountingDocumentMain row1 = AccountingDocumentMain(
        id: 1,
        reference: 2023,
        daily: 770,
        monthly: 13,
        document: 2023,
        dateDocument: '1402/05/4',
        status: 'ثبت موقت',
        total: 2650,
        detailDocument: 'حواله خروج شماره 542 در تاریخ 1402/12/20',
        separationType: 'تفکیک 1',
        documentType: 'حواله خروج کالا از انبار',
        ceilingNumber: 770,
        issuerSystem: 'حسابداری',
        note: '-');
    AccountingDocumentMain row2 = AccountingDocumentMain(
        id: 2,
        reference: 2024,
        daily: 771,
        monthly: 12,
        document: 2024,
        dateDocument: '1403/05/4',
        status: 'ثبت موقت',
        total: 0,
        detailDocument: 'سند عمومی',
        separationType: 'تفکیک 21',
        documentType: 'حواله خروج کالا از انبار',
        ceilingNumber: 750,
        issuerSystem: 'حسابداری',
        note: '-');

    list = [
      row1,
      row2,
    ];
    return DataTableViewModel(labels: labels, data: list);
  }
}
