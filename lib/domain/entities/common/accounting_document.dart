import 'abstracts/table_row_data_abs.dart';

class AccountingDocumentMain extends ITableRowData {
  int reference;
  int daily;
  int monthly;
  int document;
  String dateDocument;
  String status;
  double total;
  String detailDocument;
  String separationType;
  String documentType;
  int ceilingNumber;
  String issuerSystem;
  String note;

  AccountingDocumentMain(
      {required super.id,
      required this.reference,
      required this.daily,
      required this.monthly,
      required this.document,
      required this.dateDocument,
      required this.status,
      required this.total,
      required this.detailDocument,
      required this.separationType,
      required this.documentType,
      required this.ceilingNumber,
      required this.issuerSystem,
      required this.note,
      super.name = ''});

  @override
  List<Object?> get props => [
        reference,
        daily,
        monthly,
        document,
        dateDocument,
        status,
        total,
        detailDocument,
        separationType,
        documentType,
        ceilingNumber,
        issuerSystem,
        note,
      ];
}
