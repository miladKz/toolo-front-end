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
  final List<Account> items;
  final int type;
  final bool mahiatRialy;
  final int balanceSheetType;

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
      this.items = const [],
      required this.type,
      required this.mahiatRialy,
      required this.balanceSheetType});
}