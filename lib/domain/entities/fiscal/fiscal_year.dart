class FiscalYear {
   final int id;
  final int databaseID;

  final String activeYearName;

  final String displayName;

  FiscalYear(
      {required this.id,
      required this.databaseID,
      required this.displayName,
      required this.activeYearName});
}
