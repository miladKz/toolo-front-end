class WorkspaceDetailItem {
  final String title;
  final bool hasChildren;
  final List<WorkspaceDetailItem> children;
  bool isExpanded = false;
  bool isHovered = false;

  WorkspaceDetailItem({
    required this.title,
    this.hasChildren = false,
    this.children = const [],
  });
}
