class Account {
  final int id;
  final String accCode1;
  final String accCode2;
  final String accCode3;
  final String accCode4;
  final int accountLevel;
  final String accountcd;
  final bool canDel;
  final String description;
  final String groupCode;
  final bool hasPooli;
  final bool hasTafzili;
  final bool hasTaseir;
  final int indexOrder1;
  final int indexOrder2;
  final bool isActive;
  final bool isAmalyati;
  final List<Account> children;
  final bool hasChildren;
  final int type;
  final int mahiatRialy;
  final int balanceSheetType;
  final String displayName;

  const Account(
      {required this.id,
      required this.accCode1,
      required this.accCode2,
      required this.accCode3,
      required this.accCode4,
      required this.accountLevel,
      required this.accountcd,
      required this.canDel,
      required this.description,
      required this.groupCode,
      required this.hasPooli,
      required this.hasTafzili,
      required this.hasTaseir,
      required this.indexOrder1,
      required this.indexOrder2,
      required this.isActive,
      required this.isAmalyati,
      this.children = const [],
      this.hasChildren = false,
      required this.type,
      required this.mahiatRialy,
      required this.displayName,
      required this.balanceSheetType});
}
