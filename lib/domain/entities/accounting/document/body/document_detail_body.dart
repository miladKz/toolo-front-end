class DocumentDetailBody {
  final int voucherMSID;
  final int rowNumber;
  final int article;
  final int accountID;
  final double mablagh;
  final String description;
  final double arzRowNumber;
  final double arzMablagh;
  final int nerkhBarabari;
  final int value1;

  DocumentDetailBody(
      {required this.voucherMSID,
      required this.rowNumber,
      required this.article,
      required this.accountID,
      required this.mablagh,
      required this.description,
      required this.arzRowNumber,
      required this.arzMablagh,
      required this.nerkhBarabari,
      required this.value1
      });
}
