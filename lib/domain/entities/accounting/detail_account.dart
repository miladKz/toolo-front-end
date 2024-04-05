import '../../../presentation/widgets/main/generic_tree_view/widget_tree_model_abs.dart';

class DetailAccount extends IDataTreeModel {
  bool isActive;
  String code;
  String description;
  bool isStaff;
  bool isCustomer;
  bool isInvestee;
  bool isOther;
  bool isPartner;
  bool isSupply;
  bool isFacilitator;
  bool isReceiverFacility;
  bool isDependent;
  bool isIntermediary;
  int detailedGroupCode;

  DetailAccount({
    required super.displayName,
    required super.id,
    required super.hasChildren,
    required super.children,
    required this.isActive,
    required this.code,
    required this.description,
    required this.isStaff,
    required this.isCustomer,
    required this.isInvestee,
    required this.isOther,
    required this.isPartner,
    required this.isSupply,
    required this.isFacilitator,
    required this.isReceiverFacility,
    required this.isDependent,
    required this.isIntermediary,
    required this.detailedGroupCode,
  });
}
