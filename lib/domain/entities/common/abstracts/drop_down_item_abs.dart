abstract class IDropDownItem {
  final String name;

//each dorpable should over-ride the name in the constructor
  IDropDownItem({
    required this.name,
  });
}
