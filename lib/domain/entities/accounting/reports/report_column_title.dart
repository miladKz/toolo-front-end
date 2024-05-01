class ReportColumnTitle {
  int order;
  String name;
  String title;

  List<ReportColumnTitle> children;

  ReportColumnTitle({
    required this.order,
    required this.name,
    required this.title,
    required this.children,
  });
}
