class CreateDocumentMasterBody {
  final int categoryID;
  final int number2;
  final int numberCustom;
  final String dateBarge;
  final String description;
  final String dateBargeCustom;
  final int bargeTypeID;
  final int numberBarge;
  final String comment;
  final int modulesID;

  CreateDocumentMasterBody(
      {required this.categoryID,
      required this.number2,
      required this.numberCustom,
      required this.dateBarge,
      required this.description,
      required this.dateBargeCustom,
      required this.bargeTypeID,
      required this.numberBarge,
      required this.comment,
      required this.modulesID});
}
