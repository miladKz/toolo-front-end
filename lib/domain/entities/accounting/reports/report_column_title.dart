class ReportColumnTitle {
  int order;
  String fieldName;
  String title;

  List<ReportColumnTitle> children;

  ReportColumnTitle({
    required this.order,
    required this.fieldName,
    required this.title,
    required this.children,
  });
}
